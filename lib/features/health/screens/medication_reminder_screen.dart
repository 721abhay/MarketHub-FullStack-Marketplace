import 'package:flutter/material.dart';

class MedicationReminderScreen extends StatelessWidget {
  static const String routeName = '/medication-reminders';
  const MedicationReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('My Reminders'), backgroundColor: const Color(0xFF0EA5E9), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildStatBanner(),
            const SizedBox(height: 32),
            _buildReminderCard('Vitamin D3', '08:00 AM', 'After Breakfast', true),
            _buildReminderCard('Omega 3', '01:00 PM', 'With Lunch', false),
            _buildReminderCard('Zinc Supplement', '09:00 PM', 'Before Sleep', true),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF0EA5E9),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildStatBanner() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('3', 'Active'),
          _buildStatItem('85%', 'Adherence'),
          _buildStatItem('2', 'Day Streak'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String val, String label) {
    return Column(
      children: [
        Text(val, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0EA5E9))),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _buildReminderCard(String name, String time, String instruction, bool isTaken) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.blue[50], shape: BoxShape.circle), child: const Icon(Icons.medication, color: Color(0xFF0EA5E9))),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(fontWeight: FontWeight.bold)), Text('$time • $instruction', style: const TextStyle(color: Colors.grey, fontSize: 12))])),
          Checkbox(value: isTaken, onChanged: (v) {}, activeColor: const Color(0xFF0EA5E9)),
        ],
      ),
    );
  }
}
