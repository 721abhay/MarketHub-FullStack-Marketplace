import 'package:markethub/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  static const String routeName = '/about-us';
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'About MarketHub',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Image
            Image.network(
              'https://images.unsplash.com/photo-1556761175-5973dc0f32e7?auto=format&fit=crop&w=1600&q=80',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Our Mission',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'To clear the path for seamless, secure, and delightful online shopping experiences for everyone, everywhere.',
                    style: TextStyle(fontSize: 16, height: 1.6, color: Color(0xFF475569), fontStyle: FontStyle.italic),
                  ),
                  const Divider(height: 48),

                  const Text(
                    'Who We Are',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'MarketHub is a next-generation e-commerce platform built on the principles of trust, transparency, and technology. Founded in 2024, we started with a simple idea: that buying online should be as easy and personal as walking into your favorite local store.',
                    style: TextStyle(fontSize: 15, height: 1.6, color: Color(0xFF475569)),
                  ),
                  const SizedBox(height: 32),

                   const Text(
                    'Our Values',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(height: 16),
                  _buildValueRow(Icons.verified_user_outlined, 'Customer Obsession', 'We start with the customer and work backwards.'),
                  _buildValueRow(Icons.lightbulb_outline, 'Innovation', 'We fail fast, learn faster, and build better.'),
                  _buildValueRow(Icons.public, 'Sustainability', 'Committed to a greener future.'),

                   const SizedBox(height: 48),
                   Center(
                     child: Column(
                       children: [
                         const Text('Follow Us', style: TextStyle(fontWeight: FontWeight.bold)),
                         const SizedBox(height: 16),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             _buildSocialIcon(Icons.facebook),
                             const SizedBox(width: 16),
                             _buildSocialIcon(Icons.camera_alt),
                             const SizedBox(width: 16),
                             _buildSocialIcon(Icons.alternate_email),
                           ],
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueRow(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF6366F1), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: Color(0xFF64748B), fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
       decoration: BoxDecoration(
         color: Colors.white,
         shape: BoxShape.circle,
         boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10)],
       ),
       child: Icon(icon, color: Colors.grey[700], size: 20),
    );
  }
}
