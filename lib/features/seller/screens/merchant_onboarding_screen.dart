import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class MerchantOnboardingScreen extends StatelessWidget {
  static const String routeName = '/merchant-onboarding';
  const MerchantOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Start Selling'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text('Join the Marketplace', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Reach millions of customers in minutes.', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 48),
            CustomTextField(controller: TextEditingController(), hintText: 'Store Name'),
            const SizedBox(height: 16),
            CustomTextField(controller: TextEditingController(), hintText: 'Business Address'),
            const SizedBox(height: 16),
            CustomTextField(controller: TextEditingController(), hintText: 'Contact Representative'),
            const SizedBox(height: 48),
            CustomButton(text: 'Launch My Store', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
