import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class YourOrdersScreen extends StatelessWidget {
  static const String routeName = '/your-orders';
  const YourOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: GlobalVariables.appBarGradient,
          ),
        ),
        title: const Text(
          'Your Orders',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Center(
        child: Text('All Orders List Coming Soon'),
      ),
    );
  }
}
