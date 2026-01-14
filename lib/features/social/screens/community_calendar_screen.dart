import 'package:flutter/material.dart';

class EventsCalendarScreen extends StatelessWidget {
  static const String routeName = '/community-calendar';
  const EventsCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Community Events'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 30)),
              lastDate: DateTime.now().add(const Duration(days: 30)),
              onDateChanged: (val) {},
            ), // Simulated widget logic
            const SizedBox(height: 32),
            _buildEventEntry('UI/UX Workshop', '10:00 AM • Online'),
            _buildEventEntry('Local Meetup', '04:00 PM • Central Park'),
          ],
        ),
      ),
    );
  }

  Widget _buildEventEntry(String title, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey[200]!)),
      child: Row(
        children: [
          Container(width: 4, height: 40, decoration: BoxDecoration(color: const Color(0xFF6366F1), borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 16),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12))]),
        ],
      ),
    );
  }
}
