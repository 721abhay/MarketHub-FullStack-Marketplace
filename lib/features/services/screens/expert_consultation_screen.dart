import 'package:flutter/material.dart';

class ExpertConsultationScreen extends StatelessWidget {
  static const String routeName = '/expert-consultation';
  const ExpertConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('Expert Advice'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildExpertCategory('Legal Advisors', Icons.gavel),
            _buildExpertCategory('Financial Planners', Icons.payments),
            _buildExpertCategory('Tech Consultants', Icons.terminal),
            _buildExpertCategory('Health Coaches', Icons.fitness_center),
          ],
        ),
      ),
    );
  }

  Widget _buildExpertCategory(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: Colors.blue[50], child: Icon(icon, color: Colors.blue[800])),
          const SizedBox(width: 20),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), const Text('Verified Professionals', style: TextStyle(color: Colors.grey, fontSize: 12))])),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}
