import 'package:flutter/material.dart';

class CourseCatalogScreen extends StatelessWidget {
  static const String routeName = '/course-catalog';
  const CourseCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('All Courses'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network('https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&q=80&w=200', height: 80, width: 80, fit: BoxFit.cover)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Machine Learning Bootcamp', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const Text('Dr. Sarah Miller', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(height: 8),
                      Row(children: [const Icon(Icons.star, color: Colors.amber, size: 14), const Text(' 4.9', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)), const Spacer(), const Text('\$49.99', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold))]),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
