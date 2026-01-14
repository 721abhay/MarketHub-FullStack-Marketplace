import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class InterviewScheduler extends StatelessWidget {
  static const String routeName = '/interview-scheduler';
  const InterviewScheduler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Schedule Interview'), backgroundColor: const Color(0xFF475569), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select a Date', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 30)), onDateChanged: (v) {}),
            const SizedBox(height: 32),
            const Text('Available Time Slots', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: ['09:00 AM', '11:00 AM', '02:00 PM', '04:00 PM', '05:30 PM'].map((t) => Container(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[200]!)), child: Text(t, style: const TextStyle(fontWeight: FontWeight.bold)))).toList(),
            ),
            const SizedBox(height: 60),
            CustomButton(text: 'Confirm Interview Slot', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
