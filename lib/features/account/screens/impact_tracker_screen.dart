import 'package:flutter/material.dart';

class EnvironmentalImpactTracker extends StatelessWidget {
  static const String routeName = '/impact-tracker';
  const EnvironmentalImpactTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('My Green Impact'), backgroundColor: Colors.green[700], foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildScoreBanner(),
            const SizedBox(height: 32),
            _buildAchievementList(),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green[700]!, Colors.green[500]!]), borderRadius: BorderRadius.circular(24)),
      child: const Column(
        children: [
          Text('Your Green Score', style: TextStyle(color: Colors.white70)),
          Text('A+', style: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.w900, letterSpacing: 4)),
          SizedBox(height: 12),
          Text('Top 5% of Sustainable Shoppers', style: TextStyle(color: Colors.white70, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildAchievementList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Your Contributions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        _buildAchievementItem('Plastic Saved', '12 kg', Icons.eco),
        _buildAchievementItem('Trees Planted', '03 Units', Icons.forest),
        _buildAchievementItem('Co2 Offset', '450 kg', Icons.air),
      ],
    );
  }

  Widget _buildAchievementItem(String label, String val, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Icon(icon, color: Colors.green[700]), const SizedBox(width: 16), Text(label, style: const TextStyle(fontWeight: FontWeight.bold))]),
          Text(val, style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
    );
  }
}
