import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class GSTVerificationScreen extends StatefulWidget {
  static const String routeName = '/gst-verification';
  const GSTVerificationScreen({super.key});

  @override
  State<GSTVerificationScreen> createState() => _GSTVerificationScreenState();
}

class _GSTVerificationScreenState extends State<GSTVerificationScreen> {
  final TextEditingController _gstController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Business Verification'), backgroundColor: const Color(0xFF334155), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Icon(Icons.verified_user, size: 80, color: Color(0xFF334155)),
            const SizedBox(height: 24),
            const Text('Verify Your Business', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Enter your GST / Business Registration Number to unlock bulk pricing and tax benefits.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 48),
            CustomTextField(controller: _gstController, hintText: 'Enter GSTIN (e.g. 22AAAAA0000A1Z5)'),
            const SizedBox(height: 32),
            _buildBenefitsList(),
            const SizedBox(height: 48),
            CustomButton(text: 'Verify & Activate Business Account', onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitsList() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(20)),
      child: const Column(
        children: [
          _BenefitRow(Icons.percent, 'Exclusive Bulk Discounts'),
          SizedBox(height: 12),
          _BenefitRow(Icons.receipt_long, 'Download Tax Invoices'),
          SizedBox(height: 12),
          _BenefitRow(Icons.local_shipping, 'Business Prime Delivery'),
        ],
      ),
    );
  }
}

class _BenefitRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _BenefitRow(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(icon, size: 20, color: const Color(0xFF334155)), const SizedBox(width: 12), Text(text, style: const TextStyle(fontWeight: FontWeight.w500))]);
  }
}
