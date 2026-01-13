import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AddressesScreen extends StatelessWidget {
  static const String routeName = '/addresses';
  const AddressesScreen({super.key});

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
          'Your Addresses',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Center(
        child: Text('Saved Addresses Coming Soon'),
      ),
    );
  }
}
