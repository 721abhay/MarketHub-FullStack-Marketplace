import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../models/service_models.dart';
import '../../../providers/user_provider.dart';

class IoTServices {
  Future<List<IoTDevice>> fetchIoTDevices({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<IoTDevice> deviceList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('${GlobalVariables.uri}/api/iot/devices'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      if (!context.mounted) return deviceList;
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          var responseData = jsonDecode(res.body);
          if (responseData['success'] == true) {
            for (int i = 0; i < responseData['data'].length; i++) {
              deviceList.add(
                IoTDevice.fromMap(
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
    return deviceList;
  }
}
