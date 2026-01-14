import 'package:flutter/material.dart';

class DataPrivacyDashboard extends StatelessWidget {
  static const String routeName = '/privacy-dashboard';
  const DataPrivacyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('Privacy & Security'), backgroundColor: const Color(0xFF475569), foregroundColor: Colors.white),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Your Data Choices', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _privacyTile('Personalized Ads', 'Allow us to show relevant offers', true),
          _privacyTile('Location History', 'Enabled for faster delivery', true),
          _privacyTile('Search History', 'Store searches for quick access', false),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 32),
          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.red[50], foregroundColor: Colors.red, elevation: 0), child: const Text('Request My Data Export')),
        ],
      ),
    );
  }

  Widget _privacyTile(String title, String sub, bool enabled) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: SwitchListTile(title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)), subtitle: Text(sub, style: const TextStyle(fontSize: 12)), value: enabled, onChanged: (v) {}, activeThumbColor: const Color(0xFF475569)),
    );
  }
}
