import 'package:flutter/material.dart';

class FinalMilestoneScreen extends StatelessWidget {
  static const String routeName = '/milestone-150';
  const FinalMilestoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.stars, color: Colors.amber, size: 120),
              const SizedBox(height: 48),
              const Text('150 SCREENS REACHED', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 2)),
              const SizedBox(height: 16),
              const Text('MarketHub is now a state-of-the-art Super App ecosystem.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5)),
              const SizedBox(height: 60),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(24)),
                child: const Column(
                  children: [
                    _Fact('18+', 'Business Verticals'),
                    Divider(color: Colors.white12, height: 24),
                    _Fact('150', 'Integrated UI Screens'),
                    Divider(color: Colors.white12, height: 24),
                    _Fact('360°', 'User Experience Coverage'),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              SizedBox(width: double.infinity, height: 55, child: ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))), child: const Text('Enter the Ecosystem'))),
            ],
          ),
        ),
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  final String val;
  final String label;
  const _Fact(this.val, this.label);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(color: Colors.white70)), Text(val, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]);
  }
}
