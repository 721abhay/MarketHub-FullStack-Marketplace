import 'dart:convert';
import 'package:markethub/constants/error_handling.dart';
import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AIChatServices {
  Future<String> getAIResponse({
    required BuildContext context,
    required String message,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    String responseText = "Sorry, I'm having trouble connecting right now.";

    try {
      http.Response res = await http.post(
        Uri.parse('${GlobalVariables.uri}/api/ai/chat'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'message': message,
        }),
      );

      if (!context.mounted) return responseText;
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          responseText = jsonDecode(res.body)['response'];
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    return responseText;
  }
}
