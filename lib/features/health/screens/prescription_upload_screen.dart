import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PrescriptionUploadScreen extends StatefulWidget {
  static const String routeName = '/upload-prescription';
  const PrescriptionUploadScreen({super.key});

  @override
  State<PrescriptionUploadScreen> createState() => _PrescriptionUploadScreenState();
}

class _PrescriptionUploadScreenState extends State<PrescriptionUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Upload Prescription'), backgroundColor: const Color(0xFF0EA5E9), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Upload your prescription to order medicines', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Our pharmacists will review it and add the medicines to your cart.', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 40),
            _buildUploadBox(),
            const SizedBox(height: 32),
            _buildGuidelines(),
            const SizedBox(height: 100),
            CustomButton(text: 'Continue to Checkout', onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadBox() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF0EA5E9).withValues(alpha: 0.3), width: 2, style: BorderStyle.solid),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt_outlined, color: Color(0xFF0EA5E9), size: 48),
          SizedBox(height: 16),
          Text('Tap to Take Photo / Upload', style: TextStyle(color: Color(0xFF0EA5E9), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildGuidelines() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Prescription Guidelines', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildGuidelineItem('Doctor Details', 'Name, Degree & Medical Reg. No.'),
        _buildGuidelineItem('Patient Details', 'Name & Date of Prescription'),
        _buildGuidelineItem('Dosage Detail', 'Medicine Name & Duration'),
      ],
    );
  }

  Widget _buildGuidelineItem(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.green, size: 20),
          const SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)), Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 11))]),
        ],
      ),
    );
  }
}
