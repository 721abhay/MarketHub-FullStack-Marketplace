import 'package:markethub/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MortgageCalculator extends StatelessWidget {
  static const String routeName = '/mortgage-calculator';
  const MortgageCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Mortgage Estimator'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildResultCard(),
            const SizedBox(height: 48),
            _buildInput('Property Price', '\$450,000'),
            _buildInput('Down Payment', '\$90,000 (20%)'),
            _buildInput('Interest Rate', '5.5%'),
            _buildInput('Loan Term', '30 Years'),
            const SizedBox(height: 48),
             CustomButton(text: 'Update Calculations', onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(32)),
      child: const Column(
        children: [
          Text('Estimated Monthly Payment', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          Text('\$2,044', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          Text('Including Taxes & Insurance', style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildInput(String label, String val) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Row(children: [Text(val, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)), const SizedBox(width: 8), const Icon(Icons.edit, size: 14, color: Colors.grey)]),
        ],
      ),
    );
  }
}
