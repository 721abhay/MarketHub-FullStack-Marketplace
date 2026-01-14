import 'package:flutter/material.dart';

class GlobalSearchHub extends StatelessWidget {
  static const String routeName = '/global-search';
  const GlobalSearchHub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const TextField(decoration: InputDecoration(hintText: 'Search across all services...', border: InputBorder.none)), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Search by Vertical', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: ['Products', 'Groceries', 'Flights', 'Hotels', 'Doctors', 'Jobs'].map((t) => Chip(label: Text(t), backgroundColor: const Color(0xFFF1F5F9))).toList(),
            ),
            const SizedBox(height: 48),
            const Text('Recent Searches', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
             _searchEntry('iPhone 15 Pro Max'),
             _searchEntry('Flights to London'),
             _searchEntry('Fresh Milk Delivery'),
          ],
        ),
      ),
    );
  }

  Widget _searchEntry(String text) {
    return Padding(padding: const EdgeInsets.only(bottom: 16), child: Row(children: [const Icon(Icons.history, color: Colors.grey, size: 20), const SizedBox(width: 16), Text(text, style: const TextStyle(color: Colors.grey))]));
  }
}
