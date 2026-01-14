import 'package:flutter/material.dart';

class BusTicketScreen extends StatelessWidget {
  static const String routeName = '/bus-tickets';
  const BusTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(title: const Text('Bus Tickets'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Luxury Sleeper - AC', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Text('City X Express', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          Icon(Icons.access_time, size: 14, color: Colors.grey),
                          SizedBox(width: 4),
                          Text('10:00 PM - 06:00 AM', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('12 Seats Left', style: TextStyle(color: Colors.orange[800], fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('\$45', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF6366F1))),
                    const SizedBox(height: 8),
                    ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), child: const Text('Select')),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
