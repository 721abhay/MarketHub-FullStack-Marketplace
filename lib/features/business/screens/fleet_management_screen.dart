import 'package:flutter/material.dart';

class FleetManagementScreen extends StatelessWidget {
  static const String routeName = '/fleet-management';
  const FleetManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(title: const Text('Fleet Management'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 5,
        itemBuilder: (context, index) {
          final isInTransit = index % 2 == 0;
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const Icon(Icons.delivery_dining, color: Colors.blueGrey, size: 30),
                const SizedBox(width: 20),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Vehicle MH-0${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)), Text(isInTransit ? 'In Transit • NY-42' : 'Parked • Terminal 1', style: TextStyle(color: isInTransit ? Colors.blue : Colors.grey, fontSize: 12))])),
                const Icon(Icons.location_on, color: Colors.blueAccent),
              ],
            ),
          );
        },
      ),
    );
  }
}
