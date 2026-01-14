import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class DisputeResolutionScreen extends StatefulWidget {
  static const String routeName = '/dispute-resolution';
  const DisputeResolutionScreen({super.key});

  @override
  State<DisputeResolutionScreen> createState() => _DisputeResolutionScreenState();
}

class _DisputeResolutionScreenState extends State<DisputeResolutionScreen> {
  final TextEditingController _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Dispute Resolution'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Open a Dispute', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('If you are unhappy with a resolution or have a serious issue, our legal team will investigate.', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 32),
            _buildOrderPicker(),
            const SizedBox(height: 24),
            const Text('Reason for Dispute', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            CustomTextField(controller: _reasonController, hintText: 'Explain the issue in detail...', maxLines: 6),
            const SizedBox(height: 24),
            _buildEvidenceUpload(),
            const SizedBox(height: 48),
            CustomButton(text: 'Submit Formal Dispute', onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderPicker() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(16)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Icon(Icons.shopping_bag_outlined, color: Colors.grey), SizedBox(width: 12), Text('Select Order', style: TextStyle(fontWeight: FontWeight.bold))]),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildEvidenceUpload() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey[200]!, style: BorderStyle.solid)),
      child: const Column(
        children: [
          Icon(Icons.cloud_upload_outlined, color: Colors.blue, size: 32),
          SizedBox(height: 12),
          Text('Upload Photos / Proof', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('(Optional)', style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
