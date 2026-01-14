import 'package:flutter/material.dart';

class ApplicationStatusScreen extends StatelessWidget {
  static const String routeName = '/application-status';
  const ApplicationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(title: const Text('My Applications'), backgroundColor: const Color(0xFF475569), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 3,
        itemBuilder: (context, index) {
          final status = index == 0 ? 'Interview' : (index == 1 ? 'Applied' : 'Rejected');
          final color = index == 0 ? Colors.blue : (index == 1 ? Colors.orange : Colors.red);
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle), child: Icon(Icons.description, color: color)),
                    const SizedBox(width: 16),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Software Engineer', style: TextStyle(fontWeight: FontWeight.bold)), Text('MarketSystems • Joined 2 days ago', style: TextStyle(color: Colors.grey, fontSize: 12))])),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)), child: Text(status, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 10))),
                  ],
                ),
                if (index == 0) ...[
                  const Divider(height: 32),
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF475569), foregroundColor: Colors.white), child: const Text('Join Interview Room'))),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
