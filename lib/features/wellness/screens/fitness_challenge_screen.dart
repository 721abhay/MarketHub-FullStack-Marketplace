import 'package:flutter/material.dart';

class FitnessChallengeScreen extends StatelessWidget {
  static const String routeName = '/fitness-challenges';
  const FitnessChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Challenges'), backgroundColor: const Color(0xFFFB923C), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 3,
        itemBuilder: (context, index) {
          final titles = ['10k Steps Daily', 'Yoga Streak', 'Hydration Goal'];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: const Color(0xFFFFF7ED), borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.orange[100]!)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(titles[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const Text('Join 4,200 others', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      const SizedBox(height: 16),
                      ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFB923C), foregroundColor: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Join Challenge')),
                    ],
                  ),
                ),
                Icon(Icons.emoji_events, size: 60, color: Colors.orange[300]),
              ],
            ),
          );
        },
      ),
    );
  }
}
