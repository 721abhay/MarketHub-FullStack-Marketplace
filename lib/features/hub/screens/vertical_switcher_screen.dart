import 'package:flutter/material.dart';

class VerticalSwitcherScreen extends StatelessWidget {
  static const String routeName = '/vertical-switcher';
  const VerticalSwitcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Switch Vertical'), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.apps, color: Colors.blueGrey)),
                const SizedBox(width: 16),
                const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('MarketHub Fresh', style: TextStyle(fontWeight: FontWeight.bold)), Text('Groceries & Home Staples', style: TextStyle(color: Colors.grey, fontSize: 12))])),
                const Icon(Icons.radio_button_off, color: Colors.grey),
              ],
            ),
          );
        },
      ),
    );
  }
}
