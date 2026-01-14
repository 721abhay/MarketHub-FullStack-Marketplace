import 'package:flutter/material.dart';

class MyCertificatesScreen extends StatelessWidget {
  static const String routeName = '/my-certificates';
  const MyCertificatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(title: const Text('My Certificates'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)]),
            child: Column(
              children: [
                const Icon(Icons.workspace_premium, size: 60, color: Color(0xFF6366F1)),
                const SizedBox(height: 16),
                const Text('Certificate of Completion', style: TextStyle(color: Colors.grey, fontSize: 12, letterSpacing: 2)),
                const Text('Full Stack Web Development', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 1.2)),
                const SizedBox(height: 8),
                const Text('Issued on 12 Jan 2026', style: TextStyle(color: Colors.grey, fontSize: 13)),
                const Divider(height: 48),
                Row(
                  children: [
                    Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.download), label: const Text('Download PDF'), style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))))),
                    const SizedBox(width: 12),
                    Expanded(child: ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.share), label: const Text('Share'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))))),
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
