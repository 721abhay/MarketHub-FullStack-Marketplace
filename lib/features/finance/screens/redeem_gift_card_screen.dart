import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class GiftCardRedeemScreen extends StatefulWidget {
  static const String routeName = '/redeem-gift-card';
  const GiftCardRedeemScreen({super.key});

  @override
  State<GiftCardRedeemScreen> createState() => _GiftCardRedeemScreenState();
}

class _GiftCardRedeemScreenState extends State<GiftCardRedeemScreen> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Redeem Gift Card'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(Icons.qr_code_scanner, size: 80, color: Color(0xFF6366F1)),
            const SizedBox(height: 24),
            const Text('Enter Claim Code', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Enter the 16-digit code from your email or physical card to add balance to your account.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 48),
            CustomTextField(controller: _codeController, hintText: 'Example: ABCD-1234-EFGH-5678'),
            const SizedBox(height: 40),
            CustomButton(text: 'Apply to Balance', onTap: () {}),
            const SizedBox(height: 32),
            _buildScanningOption(),
          ],
        ),
      ),
    );
  }

  Widget _buildScanningOption() {
    return Column(
      children: [
        const Row(children: [Expanded(child: Divider()), Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('OR', style: TextStyle(color: Colors.grey))), Expanded(child: Divider())]),
        const SizedBox(height: 32),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.camera_alt),
          label: const Text('Scan Your Code'),
          style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), minimumSize: const Size(double.infinity, 50)),
        ),
      ],
    );
  }
}
