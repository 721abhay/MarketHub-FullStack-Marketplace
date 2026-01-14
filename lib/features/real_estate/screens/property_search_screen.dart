import 'package:flutter/material.dart';

class PropertySearchScreen extends StatelessWidget {
  static const String routeName = '/property-search';
  const PropertySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Filter Properties'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Price Range', style: TextStyle(fontWeight: FontWeight.bold)),
            RangeSlider(values: const RangeValues(20, 80), max: 100, divisions: 10, labels: const RangeLabels('\$200k', '\$800k'), onChanged: (v) {}),
            const SizedBox(height: 32),
            const Text('Property Type', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(spacing: 8, children: ['House', 'Vila', 'Office', 'Apartment', 'Land'].map((t) => FilterChip(label: Text(t), onSelected: (v) {})).toList()),
            const SizedBox(height: 32),
            const Text('Bedrooms', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [1, 2, 3, '4+'].map((n) => _circleSelection(n.toString())).toList()),
            const SizedBox(height: 100),
            SizedBox(width: double.infinity, height: 55, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))), child: const Text('Search Properties'))),
          ],
        ),
      ),
    );
  }

  Widget _circleSelection(String val) {
    return Container(width: 60, height: 60, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey[300]!)), child: Center(child: Text(val, style: const TextStyle(fontWeight: FontWeight.bold))));
  }
}
