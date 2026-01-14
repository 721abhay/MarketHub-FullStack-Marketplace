import 'package:flutter/material.dart';

class CustomThemeSelector extends StatelessWidget {
  static const String routeName = '/theme-selector';
  const CustomThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('App Appearance'), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            _themePreview('System Default', Colors.grey),
            _themePreview('Midnight OLED', Colors.black),
            _themePreview('Solar Glow', Colors.orange),
            _themePreview('MarketHub Classic', const Color(0xFF6366F1)),
          ],
        ),
      ),
    );
  }

  Widget _themePreview(String label, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(width: 40, height: 40, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
          const SizedBox(width: 16),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          const Icon(Icons.radio_button_off, color: Colors.grey),
        ],
      ),
    );
  }
}
