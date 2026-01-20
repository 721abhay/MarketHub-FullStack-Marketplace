import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../models/product.dart';
import '../../../providers/user_provider.dart';

class VisualSearchServices {
  Future<List<Product>> searchByImage({
    required BuildContext context,
    required File image,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${GlobalVariables.uri}/api/ai/visual-search'),
      );
      
      request.headers.addAll({
        'x-auth-token': userProvider.user.token,
      });

      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          image.path,
        ),
      );

      http.StreamedResponse streamedRes = await request.send();
      http.Response res = await http.Response.fromStream(streamedRes);

      if (!context.mounted) return productList;
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          var responseData = jsonDecode(res.body);
          if (responseData['success'] == true) {
            for (int i = 0; i < responseData['data'].length; i++) {
              productList.add(
                Product.fromMap(
                  responseData['data'][i],
                ),
              );
            }
          }
        },
      );
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
    return productList;
  }
}
