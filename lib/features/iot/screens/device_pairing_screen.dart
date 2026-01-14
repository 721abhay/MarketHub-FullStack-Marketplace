import 'package:flutter/material.dart';

class DevicePairingScreen extends StatelessWidget {
  static const String routeName = '/device-pairing';
  const DevicePairingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Add New Device'), backgroundColor: const Color(0xFF0F172A), foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Icon(Icons.bluetooth_searching, size: 80, color: Colors.blueAccent),
            const SizedBox(height: 32),
            const Text('Scanning for Devices...', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('Make sure your device is in pairing mode.', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 48),
            _buildFoundDevice('MarketHub Lamp v2', 'Ready to Pair'),
            _buildFoundDevice('Smart Plug S1', 'Strong Signal'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0F172A), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))), child: const Text('Continue')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoundDevice(String name, String status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          const Icon(Icons.devices, color: Colors.blueAccent),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(fontWeight: FontWeight.bold)), Text(status, style: const TextStyle(color: Colors.grey, fontSize: 12))])),
          const Icon(Icons.add_circle_outline, color: Colors.blueAccent),
        ],
      ),
    );
  }
}
