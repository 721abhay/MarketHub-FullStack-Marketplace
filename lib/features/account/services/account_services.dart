import 'dart:convert';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/models/notification.dart' as model;
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AccountServices {
  Future<List<Order>> fetchMyOrders({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Order> orderList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('${GlobalVariables.uri}/api/orders/me'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      if (!context.mounted) return [];
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return orderList;
  }

  void logOut(BuildContext context) async {
    try {
       // Clear local storage if needed, then navigate to auth
       Navigator.pushNamedAndRemoveUntil(
        context,
        '/', // Assuming AuthScreen or root is the handler
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<model.Notification>> fetchNotifications({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<model.Notification> notificationList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('${GlobalVariables.uri}/api/notifications'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      if (!context.mounted) return [];
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            notificationList.add(
              model.Notification.fromMap(
                jsonDecode(res.body)[i],
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return notificationList;
  }

  void markAsRead({
    required BuildContext context,
    required String id,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      await http.post(
        Uri.parse('${GlobalVariables.uri}/api/mark-notification-read'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({'id': id}),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
