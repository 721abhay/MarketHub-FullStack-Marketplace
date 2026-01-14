import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BusinessLicenseUpload extends StatelessWidget {
  static const String routeName = '/business-docs';
  const BusinessLicenseUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Compliance Verification'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Icon(Icons.document_scanner, size: 80, color: Color(0xFF475569)),
            const SizedBox(height: 32),
            const Text('Document Upload', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text('Upload your Trade License or GST certificate.', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 48),
            _buildUploadPlaceholder('Trade License'),
            const SizedBox(height: 16),
            _buildUploadPlaceholder('Tax ID Certificate'),
            const SizedBox(height: 48),
            CustomButton(text: 'Submit for Review', onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadPlaceholder(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey[300]!, style: BorderStyle.solid)),
      child: Row(children: [const Icon(Icons.cloud_upload_outlined, color: Colors.blueAccent), const SizedBox(width: 16), Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)))]),
    );
  }
}
