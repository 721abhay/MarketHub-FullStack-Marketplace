import 'package:markethub/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferralScreen extends StatelessWidget {
  static const String routeName = '/referral';
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String referralCode = 'ABHAY2026';

    void copyToClipboard() {
      Clipboard.setData(const ClipboardData(text: referralCode));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Referral Code Copied!')),
      );
    }

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
            'Invite Friends',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/3893/3893059.png', // Fallback illustration
              height: 200,
            ),
            const SizedBox(height: 32),
            const Text(
              'Earn \$50 for every friend!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              'Invite your friends to MarketHub. They get \$20 off their first order, and you get \$50 credit when they shop.',
              style: TextStyle(fontSize: 15, color: Color(0xFF64748B), height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF6366F1), width: 1.5),
                boxShadow: [
                  BoxShadow(color: const Color(0xFF6366F1).withValues(alpha: 0.1), blurRadius: 10),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Code', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                      SizedBox(height: 4),
                      Text(referralCode, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                    ],
                  ),
                  IconButton(
                    onPressed: copyToClipboard,
                    icon: const Icon(Icons.copy_rounded, color: Color(0xFF6366F1)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                   // Mock Share
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sharing Link...')));
                },
                icon: const Icon(Icons.share_rounded),
                label: const Text('Share Link'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
