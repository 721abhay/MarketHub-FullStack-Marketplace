import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatefulWidget {
  static const String routeName = '/video-player';
  final String title;
  const VideoPlayerScreen({super.key, required this.title});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  bool _isPlaying = true;
  double _currentSliderValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
            ),
            const Spacer(),
            // Mock Video Content
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.white10,
              child: Stack(
                alignment: Alignment.center,
                children: [
                   Image.network('https://images.unsplash.com/photo-1536440136628-849c177e76a1?auto=format&fit=crop&q=80&w=600', width: double.infinity, fit: BoxFit.cover, opacity: const AlwaysStoppedAnimation(0.5)),
                   _isPlaying 
                    ? IconButton(icon: const Icon(Icons.pause_circle_filled_rounded, size: 80, color: Colors.white), onPressed: () => setState(() => _isPlaying = false))
                    : IconButton(icon: const Icon(Icons.play_circle_filled_rounded, size: 80, color: Colors.white), onPressed: () => setState(() => _isPlaying = true)),
                ],
              ),
            ),
            const Spacer(),
            _buildControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('2024 • Action • HD', style: TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 32),
          Slider(
            value: _currentSliderValue,
            max: 100,
            activeColor: const Color(0xFF00A8E1),
            inactiveColor: Colors.white24,
            onChanged: (val) => setState(() => _currentSliderValue = val),
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('0:24', style: TextStyle(color: Colors.white, fontSize: 10)), Text('1:45:00', style: TextStyle(color: Colors.white, fontSize: 10))]),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(icon: const Icon(Icons.replay_10_rounded, color: Colors.white), onPressed: () {}),
              IconButton(icon: Icon(_isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded, color: Colors.white, size: 40), onPressed: () => setState(() => _isPlaying = !_isPlaying)),
              IconButton(icon: const Icon(Icons.forward_10_rounded, color: Colors.white), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
