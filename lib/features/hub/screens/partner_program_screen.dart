import 'package:flutter/material.dart';

class PartnerProgramScreen extends StatelessWidget {
  static const String routeName = '/partners';
  const PartnerProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Partner With Us'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Icon(Icons.handshake_outlined, size: 80, color: Colors.indigo),
            const SizedBox(height: 32),
            const Text('Grow Your Business', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Leverage the MarketHub ecosystem to reach millions.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 48),
            _buildPartnerEntry('Be a Delivery Partner', Icons.delivery_dining),
            _buildPartnerEntry('Be a Service Pro', Icons.handyman),
            _buildPartnerEntry('List Your Hotel', Icons.hotel),
            const SizedBox(height: 48),
            SizedBox(width: double.infinity, height: 55, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))), child: const Text('Apply Now'))),
          ],
        ),
      ),
    );
  }

  Widget _buildPartnerEntry(String title, IconData icon) {
    return Padding(padding: const EdgeInsets.only(bottom: 24), child: Row(children: [Icon(icon, color: Colors.indigo), const SizedBox(width: 20), Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))]));
  }
}
