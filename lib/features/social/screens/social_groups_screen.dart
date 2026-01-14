import 'package:flutter/material.dart';

class SocialGroupsScreen extends StatelessWidget {
  static const String routeName = '/social-groups';
  const SocialGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(title: const Text('Communities'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 4,
        itemBuilder: (context, index) {
          final groupNames = ['Design Enthusiasts', 'Tech Innovators', 'Fitness Warriors', 'Cooking Masters'];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: Row(
              children: [
                CircleAvatar(radius: 30, backgroundImage: NetworkImage('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&q=80&w=200')),
                const SizedBox(width: 20),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(groupNames[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), const Text('12.4k Members • 42 Online', style: TextStyle(color: Colors.grey, fontSize: 12))])),
                ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Join')),
              ],
            ),
          );
        },
      ),
    );
  }
}
