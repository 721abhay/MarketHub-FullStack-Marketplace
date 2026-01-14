import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String routeName = '/privacy-policy';
  const PrivacyPolicyScreen({super.key});

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
            'Privacy Policy',
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
              'Your Privacy Matters',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 12),
            const Text(
              'Effective Date: January 01, 2026',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const Divider(height: 48),
            _buildSection(
              'Information We Collect',
              'We collect information you provide directly to us, such as when you create an account, update your profile, make a purchase, or communicate with us. This includes name, email, shipping address, and payment information.',
            ),
             _buildSection(
              'How We Use Information',
              'We use information to provide, maintain, and improve our services, process transactions, send you technical notices and support messages, and communicate with you about products, services, offers, and events.',
            ),
             _buildSection(
              'Data Security',
              'We implement reasonable security measures to protect the security of your personal information. However, please be aware that no method of transmission over the Internet is 100% secure.',
            ),
             _buildSection(
              'Third-Party Services',
              'We may use third-party services that collect, monitor, and analyze this type of information in order to increase our Service\'s functionality.',
            ),
             _buildSection(
              'Cookies',
              'We use cookies and similar tracking technologies to track the activity on our Service and hold certain information.',
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.lock_outline_rounded, color: Color(0xFF64748B)),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'For any privacy concerns, please contact our Data Protection Officer at privacy@markethub.com',
                      style: TextStyle(fontSize: 13, color: Color(0xFF475569)),
                    ),
                  ),
                ],
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
