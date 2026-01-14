import 'package:flutter/material.dart';

class VisualSearchScreen extends StatelessWidget {
  static const String routeName = '/visual-search';
  const VisualSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Mock Camera Preview
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white10,
            child: const Center(child: Icon(Icons.camera_alt_outlined, color: Colors.white38, size: 80)),
          ),
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => Navigator.pop(context)),
                      const Text('Visual Search', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      IconButton(icon: const Icon(Icons.flash_off, color: Colors.white), onPressed: () {}),
                    ],
                  ),
                  const Spacer(),
                  const Text('Point your camera at a product to find similar items', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _searchOption(Icons.photo_library_outlined, 'Gallery'),
                      const SizedBox(width: 48),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 4)),
                        child: CircleAvatar(radius: 35, backgroundColor: Colors.white),
                      ),
                      const SizedBox(width: 48),
                      _searchOption(Icons.history, 'History'),
                    ],
                  ),
                  const SizedBox(height: 64),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchOption(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
