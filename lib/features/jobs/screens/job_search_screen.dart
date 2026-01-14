import 'package:flutter/material.dart';

class JobSearchScreen extends StatelessWidget {
  static const String routeName = '/job-search';
  const JobSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Filter Jobs'), backgroundColor: const Color(0xFF475569), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Employment Type', style: TextStyle(fontWeight: FontWeight.bold)),
             const SizedBox(height: 12),
             Wrap(spacing: 8, children: ['Full-time', 'Contract', 'Part-time', 'Freelance'].map((t) => FilterChip(label: Text(t), onSelected: (v) {})).toList()),
             const SizedBox(height: 32),
             const Text('Location', style: TextStyle(fontWeight: FontWeight.bold)),
             const SizedBox(height: 12),
             Container(padding: const EdgeInsets.symmetric(horizontal: 16), decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(12)), child: const TextField(decoration: InputDecoration(hintText: 'City or Country', border: InputBorder.none))),
             const SizedBox(height: 32),
             const Text('Salary Expectations', style: TextStyle(fontWeight: FontWeight.bold)),
             RangeSlider(values: const RangeValues(40, 90), max: 200, divisions: 20, labels: const RangeLabels('\$40k', '\$90k'), onChanged: (v) {}),
             const SizedBox(height: 100),
             SizedBox(width: double.infinity, height: 55, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF475569), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))), child: const Text('Show Results'))),
          ],
        ),
      ),
    );
  }
}
