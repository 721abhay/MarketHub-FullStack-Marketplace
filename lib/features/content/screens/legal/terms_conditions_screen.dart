import 'package:markethub/constants/global_variables.dart';
import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  static const String routeName = '/terms-conditions';
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Terms & Conditions',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Last Updated: January 01, 2026',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 24),
            _buildSection(
              '1. Introduction',
              'Welcome to MarketHub. By accessing or using our website and mobile application, you agree to be bound by these Terms and Conditions.',
            ),
             _buildSection(
              '2. User Accounts',
              'You are responsible for maintaining the confidentiality of your account credentials. You agree to accept responsibility for all activities that occur under your account.',
            ),
             _buildSection(
              '3. Product Information',
              'We attempt to be as accurate as possible. However, MarketHub does not warrant that product descriptions or other content is accurate, complete, reliable, current, or error-free.',
            ),
             _buildSection(
              '4. Returns and Refunds',
              'Our Return & Refund Policy allows for returns within 30 days of purchase for eligible items. Refunds will be processed to the original payment method.',
            ),
             _buildSection(
              '5. Intellectual Property',
              'All content included on this Service, such as text, graphics, logos, images, and software, is the property of MarketHub or its content suppliers.',
            ),
             _buildSection(
              '6. Limitation of Liability',
              'MarketHub shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use or inability to use the service.',
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(
                '© 2026 MarketHub Inc. All rights reserved.',
                style: TextStyle(color: Colors.grey[400], fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 15, height: 1.6, color: Color(0xFF475569)),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
