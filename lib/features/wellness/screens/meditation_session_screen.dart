import 'package:flutter/material.dart';

class MeditationSessionScreen extends StatelessWidget {
  static const String routeName = '/meditation-play';
  const MeditationSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      body: Stack(
        children: [
          Positioned.fill(child: Image.network('https://images.unsplash.com/photo-1506126613408-eca07ce68773?auto=format&fit=crop&q=80&w=800', fit: BoxFit.cover, color: Colors.black45, colorBlendMode: BlendMode.darken)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft, child: IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => Navigator.pop(context))),
                  const Spacer(),
                  const Text('Evening Calm', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  const Text('10 Minute Breathwork', style: TextStyle(color: Colors.white70, fontSize: 16)),
                  const SizedBox(height: 48),
                  Container(width: 80, height: 80, decoration: BoxDecoration(color: Colors.white24, shape: BoxShape.circle), child: const Icon(Icons.play_arrow, color: Colors.white, size: 40)),
                  const Spacer(),
                  const Text('RELAX • BREATHE • RELEASE', style: TextStyle(color: Colors.white38, letterSpacing: 4, fontSize: 11)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
