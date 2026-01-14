import 'package:flutter/material.dart';

class SleepTrackerScreen extends StatelessWidget {
  static const String routeName = '/sleep-tracker';
  const SleepTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(title: const Text('Sleep Insights'), backgroundColor: Colors.transparent, foregroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildSleepScore(),
            const SizedBox(height: 32),
             _buildSleepStages(),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepScore() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(32), border: Border.all(color: Colors.indigo.withValues(alpha: 0.2))),
      child: const Column(
        children: [
          Text('Last Night\'s Score', style: TextStyle(color: Colors.white70)),
          Text('84', style: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold)),
          Text('Good Quality', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSleepStages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Sleep Stages', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _stageBar('Deep Sleep', '1h 20m', 0.2, Colors.indigo),
        _stageBar('REM Sleep', '2h 10m', 0.35, Colors.purple),
        _stageBar('Light Sleep', '4h 05m', 0.45, Colors.blue),
      ],
    );
  }

  Widget _stageBar(String label, String dur, double pct, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(color: Colors.white70)), Text(dur, style: TextStyle(color: color, fontWeight: FontWeight.bold))]),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: pct, backgroundColor: Colors.white10, color: color, minHeight: 6, borderRadius: BorderRadius.circular(3)),
        ],
      ),
    );
  }
}
