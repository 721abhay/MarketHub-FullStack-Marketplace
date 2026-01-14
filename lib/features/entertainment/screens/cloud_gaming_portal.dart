import 'package:flutter/material.dart';

class CloudGamingPortal extends StatelessWidget {
  static const String routeName = '/cloud-gaming';
  const CloudGamingPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(child: Image.network('https://images.unsplash.com/photo-1511512578047-dfb367046420?auto=format&fit=crop&q=80&w=800', fit: BoxFit.cover, color: Colors.black45, colorBlendMode: BlendMode.darken)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('M A R K E T H U B   G A M E S', style: TextStyle(color: Colors.greenAccent, letterSpacing: 4, fontSize: 12)),
                  const Spacer(),
                  const Text('Play Anywhere,\nAnytime.', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold, height: 1.1)),
                  const SizedBox(height: 24),
                  const Text('Stream AAA titles directly to your phone with ultra-low latency.', style: TextStyle(color: Colors.white70, fontSize: 16)),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))), child: const Text('LAUNCH CLOUD PORTAL', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
