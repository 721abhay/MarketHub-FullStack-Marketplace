import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ResumeBuilderScreen extends StatelessWidget {
  static const String routeName = '/resume-builder';
  const ResumeBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController expController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Digital Resume Builder'), backgroundColor: const Color(0xFF475569), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your Professional Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Enter your details to generate an AI-enhanced resume.', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 32),
            _buildSectionHeader('Experience'),
            CustomTextField(controller: expController, hintText: 'Company, Role, and major achievements...', maxLines: 5),
            const SizedBox(height: 24),
            _buildSectionHeader('Education'),
            CustomTextField(controller: TextEditingController(), hintText: 'University, Degree, and Year...'),
            const SizedBox(height: 24),
            _buildSectionHeader('Top Skills'),
            Wrap(spacing: 8, children: ['Flutter', 'Node.js', 'System Design'].map((s) => Chip(label: Text(s), onDeleted: () {})).toList()),
            const SizedBox(height: 48),
            CustomButton(text: 'Generate Resume', onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
     return Padding(padding: const EdgeInsets.only(bottom: 12), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), const Icon(Icons.add_circle_outline, size: 18, color: Colors.blue)]));
  }
}
