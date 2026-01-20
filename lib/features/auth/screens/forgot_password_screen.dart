import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = '/forgot-password';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Forgot Password?',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
            const SizedBox(height: 12),
            const Text(
              'Don\'t worry! It happens. Please enter the email address associated with your account.',
              style: TextStyle(color: Color(0xFF64748B), fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 48),
            CustomTextField(
              controller: _emailController,
              hintText: 'Enter your email',
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Send Code',
              onTap: () {
                // Mock interaction
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Verification code sent to your email!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
