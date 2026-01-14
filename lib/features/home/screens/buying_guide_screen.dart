import 'package:flutter/material.dart';

class BuyingGuideScreen extends StatelessWidget {
  static const String routeName = '/buying-guide';
  final String category;
  const BuyingGuideScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('$category Buying Guide', style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&q=80&w=800'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text('What to look for?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _guideItem('1. Performance', 'Check for the latest processors and RAM for smooth multitasking.'),
            _guideItem('2. Build Quality', 'Premium materials like aluminum or glass ensure longevity.'),
            _guideItem('3. Battery Life', 'Minimum 4000mAh for a full day of heavy usage.'),
            _guideItem('4. Value for Money', 'Compare specs with similar priced competitors.'),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(24)),
              child: const Column(
                children: [
                  Text('Need more help?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Chat with our product experts available 24/7.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 20),
                  Text('Chat Now', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _guideItem(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }
}
