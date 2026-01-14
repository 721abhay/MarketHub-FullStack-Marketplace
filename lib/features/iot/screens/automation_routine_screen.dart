import 'package:flutter/material.dart';

class AutomationRoutineScreen extends StatelessWidget {
  static const String routeName = '/home-automation';
  const AutomationRoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('Routines'), backgroundColor: const Color(0xFF0F172A), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)]),
            child: Row(
              children: [
                Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.blue[50], shape: BoxShape.circle), child: const Icon(Icons.auto_fix_high, color: Colors.blueAccent)),
                const SizedBox(width: 16),
                const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Good Morning', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text('7:00 AM • Lights & Coffee', style: TextStyle(color: Colors.grey, fontSize: 12))])),
                Switch(value: true, onChanged: (v) {}, activeThumbColor: Colors.blueAccent),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, backgroundColor: const Color(0xFF0F172A), child: const Icon(Icons.add_task, color: Colors.white)),
    );
  }
}
