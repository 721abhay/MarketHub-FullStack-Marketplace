import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatelessWidget {
  static const String routeName = '/music-player';
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1DB954).withValues(alpha: 0.05), // Subtle green tint
      appBar: AppBar(title: const Text('Music Player'), backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 300, decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), image: const DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1470225620780-dba8ba36b745?auto=format&fit=crop&q=80&w=600'), fit: BoxFit.cover), boxShadow: [BoxShadow(color: Colors.green.withValues(alpha: 0.2), blurRadius: 40, offset: const Offset(0, 20))])),
            const SizedBox(height: 48),
            const Text('Starlight Symphony', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Cyber Orchestra', style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 48),
            _buildPlaybackControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaybackControls() {
    return Column(
      children: [
        Slider(value: 0.4, onChanged: (v) {}, activeColor: const Color(0xFF1DB954), inactiveColor: Colors.grey[300]),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 24), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('01:24', style: TextStyle(color: Colors.grey, fontSize: 12)), Text('03:45', style: TextStyle(color: Colors.grey, fontSize: 12))])),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.shuffle, color: Colors.grey),
            const Icon(Icons.skip_previous, size: 32),
            CircleAvatar(radius: 35, backgroundColor: const Color(0xFF1DB954), child: const Icon(Icons.play_arrow, color: Colors.white, size: 40)),
            const Icon(Icons.skip_next, size: 32),
            const Icon(Icons.repeat, color: Colors.grey),
          ],
        ),
      ],
    );
  }
}
