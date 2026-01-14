import 'package:flutter/material.dart';

class SupplierBiddingScreen extends StatelessWidget {
  static const String routeName = '/supplier-bidding';
  const SupplierBiddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Live Bidding'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey[200]!)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('Raw Material X', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text('${4 - index} Suppliers Bidding', style: TextStyle(color: Colors.grey, fontSize: 12))]),
                Column(children: [const Text('Lowest Bid', style: TextStyle(color: Colors.grey, fontSize: 10)), Text('\$${1200 - index * 50}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green))]),
              ],
            ),
          );
        },
      ),
    );
  }
}
