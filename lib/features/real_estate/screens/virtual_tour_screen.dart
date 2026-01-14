import 'package:flutter/material.dart';

class VirtualTourScreen extends StatelessWidget {
  static const String routeName = '/virtual-tour';
  const VirtualTourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(child: Image.network('https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?auto=format&fit=crop&q=80&w=800', fit: BoxFit.cover)),
          _buildNavigationOverlay(context),
          _buildCompass(),
        ],
      ),
    );
  }

  Widget _buildNavigationOverlay(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => Navigator.pop(context)), const Text('MASTER BEDROOM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)), const Icon(Icons.share, color: Colors.white)]),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _navDot(Icons.arrow_upward, 'Living Room'),
                const SizedBox(width: 48),
                _navDot(Icons.arrow_forward, 'Kitchen'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _navDot(IconData icon, String label) {
    return Column(children: [CircleAvatar(backgroundColor: Colors.white.withValues(alpha: 0.3), child: Icon(icon, color: Colors.white)), const SizedBox(height: 8), Text(label, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))]);
  }

  Widget _buildCompass() {
    return Positioned(bottom: 40, right: 32, child: Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.black45, shape: BoxShape.circle, border: Border.all(color: Colors.white24)), child: const Icon(Icons.explore_outlined, color: Colors.white, size: 30)));
  }
}
