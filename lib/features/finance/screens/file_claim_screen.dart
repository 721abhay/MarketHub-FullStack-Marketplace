import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class FileClaimScreen extends StatefulWidget {
  static const String routeName = '/file-claim';
  const FileClaimScreen({super.key});

  @override
  State<FileClaimScreen> createState() => _FileClaimScreenState();
}

class _FileClaimScreenState extends State<FileClaimScreen> {
  String _selectedPolicy = 'Device Care+';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('File a Claim', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Policy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            _buildPolicySelect(),
            const SizedBox(height: 32),
            const Text('What happened?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            _buildIncidentField(),
            const SizedBox(height: 32),
            const Text('Upload Photos/Proof', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            _buildUploadBox(),
            const SizedBox(height: 48),
            CustomButton(
              text: 'Submit Claim',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    title: const Text('Claim Filed!'),
                    content: const Text('Your claim application (ID: CLM-9021) has been received. Our team will review it within 24 hours.'),
                    actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text('Got it!'))],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicySelect() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(16)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedPolicy,
          isExpanded: true,
          items: ['Device Care+', 'Health Guard', 'Travel Secure'].map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
          onChanged: (val) => setState(() => _selectedPolicy = val!),
        ),
      ),
    );
  }

  Widget _buildIncidentField() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(
        hintText: 'Describe the incident in detail...',
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildUploadBox() {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.add_a_photo_rounded, color: Colors.blue), SizedBox(height: 8), Text('Attach Images', style: TextStyle(color: Colors.grey, fontSize: 12))]),
    );
  }
}
