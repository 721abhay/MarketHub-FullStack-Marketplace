import 'package:flutter/material.dart';

class LearningHomeScreen extends StatelessWidget {
  static const String routeName = '/learning-home';
  const LearningHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(title: const Text('MarketHub Learning'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildContinueLearning(),
            const SizedBox(height: 32),
            _buildCourseGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueLearning() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Continue where you left off', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 8),
          const Text('Advanced Mobile Development', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          LinearProgressIndicator(value: 0.65, backgroundColor: Colors.grey[200], color: const Color(0xFF6366F1), minHeight: 8, borderRadius: BorderRadius.circular(4)),
          const SizedBox(height: 8),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('65% Completed', style: TextStyle(color: Colors.grey, fontSize: 12)), Text('12/18 Lessons', style: TextStyle(color: Colors.grey, fontSize: 12))]),
        ],
      ),
    );
  }

  Widget _buildCourseGrid() {
    final courses = ['UI/UX Design', 'Cloud Computing', 'Data Science', 'Business Strategy'];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 0.8),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Expanded(child: ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(20)), child: Image.network('https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&q=80&w=300', fit: BoxFit.cover))),
              Padding(padding: const EdgeInsets.all(12), child: Text(courses[index], textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
            ],
          ),
        );
      },
    );
  }
}
