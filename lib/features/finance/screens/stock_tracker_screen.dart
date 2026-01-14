import 'package:flutter/material.dart';

class StockTrackerScreen extends StatelessWidget {
  static const String routeName = '/stock-tracker';
  const StockTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF030712), // Slate-950
      appBar: AppBar(title: const Text('Market Insights'), backgroundColor: Colors.black, foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 6,
        itemBuilder: (context, index) {
          final isUp = index % 2 == 0;
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.03), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white10)),
            child: Row(
              children: [
                Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(12)), child: Text('AMZN', style: TextStyle(color: Colors.blue[300], fontWeight: FontWeight.bold))),
                const SizedBox(width: 16),
                const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Amazon.com Inc.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text('NASDAQ', style: TextStyle(color: Colors.grey, fontSize: 12))])),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('\$185.20', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(isUp ? '+1.45%' : '-0.24%', style: TextStyle(color: isUp ? Colors.greenAccent : Colors.redAccent, fontSize: 12, fontWeight: FontWeight.bold)),
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
