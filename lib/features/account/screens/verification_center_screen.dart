import 'package:flutter/material.dart';

class VerificationCenterScreen extends StatelessWidget {
  static const String routeName = '/verification-center';
  const VerificationCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('ID Verification'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Icon(Icons.verified_user_outlined, size: 80, color: Colors.blueAccent),
            const SizedBox(height: 32),
            const Text('Verify Your Identity', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text('A verified badge increases trust and enables high-value transactions.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 48),
            _statusRow('Email Verified', true),
            _statusRow('Phone Verified', true),
            _statusRow('Photo ID', false),
            const Spacer(),
            SizedBox(width: double.infinity, height: 55, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))), child: const Text('Start Bio-Verification'))),
          ],
        ),
      ),
    );
  }

  Widget _statusRow(String label, bool isDone) {
    return Padding(padding: const EdgeInsets.only(bottom: 20), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(fontWeight: FontWeight.bold)), Icon(isDone ? Icons.check_circle : Icons.pending, color: isDone ? Colors.green : Colors.orange)]));
  }
}
