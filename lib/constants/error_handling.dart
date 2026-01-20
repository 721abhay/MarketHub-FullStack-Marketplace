import 'dart:convert';
import 'package:markethub/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  final responseData = jsonDecode(response.body);
  final String message = responseData['message'] ?? responseData['msg'] ?? responseData['error'] ?? 'An unknown error occurred';

  switch (response.statusCode) {
    case 200:
    case 201:
      onSuccess();
      break;
    case 400:
    case 401:
    case 404:
      showSnackBar(context, message);
      break;
    case 500:
      showSnackBar(context, message);
      break;
    default:
      showSnackBar(context, response.body);
  }
}
