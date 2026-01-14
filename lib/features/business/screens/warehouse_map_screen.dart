import 'package:flutter/material.dart';

class WarehouseMapScreen extends StatelessWidget {
  static const String routeName = '/warehouse-map';
  const WarehouseMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(title: const Text('Warehouse Optimization'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: Column(
        children: [
          Expanded(child: Container(color: Colors.white, child: const Center(child: Text('2D/3D WAREHOUSE LAYOUT', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 2))))),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
            child: Column(
              children: [
                _buildMetric('Rack Utilization', '85%', Colors.green),
                const SizedBox(height: 16),
                _buildMetric('Pick efficiency', '92%', Colors.blueAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(String label, String val, Color color) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(fontWeight: FontWeight.bold)), Text(val, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18))]);
  }
}
