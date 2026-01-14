import 'package:flutter/material.dart';

class MentalHealthHomeScreen extends StatelessWidget {
  static const String routeName = '/mental-wellness';
  const MentalHealthHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFB), // Soft warm off-white
      appBar: AppBar(title: const Text('Mind & Wellness'), backgroundColor: const Color(0xFF90A4AE), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildFeelingBanner(),
            const SizedBox(height: 32),
            _buildWellnessGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildFeelingBanner() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(color: const Color(0xFFE0F2F1), borderRadius: BorderRadius.circular(32)),
      child: const Column(
        children: [
          Text('How are you feeling today?', style: TextStyle(color: Color(0xFF004D40), fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Text('😊', style: TextStyle(fontSize: 32)), Text('😐', style: TextStyle(fontSize: 32)), Text('😔', style: TextStyle(fontSize: 32)), Text('😫', style: TextStyle(fontSize: 32))]),
        ],
      ),
    );
  }

  Widget _buildWellnessGrid() {
    final activities = [
       {'name': 'Meditation', 'icon': Icons.self_improvement, 'color': Colors.blueGrey},
       {'name': 'Sleep Stories', 'icon': Icons.nights_stay, 'color': Colors.indigo},
       {'name': 'Focus Music', 'icon': Icons.music_note, 'color': Colors.amber},
       {'name': 'Quick Journal', 'icon': Icons.edit_note, 'color': Colors.teal},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 1.2),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(activities[index]['icon'] as IconData, color: activities[index]['color'] as Color, size: 30),
              const SizedBox(height: 12),
              Text(activities[index]['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
        );
      },
    );
  }
}
