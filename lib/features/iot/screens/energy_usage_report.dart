import 'package:flutter/material.dart';

class EnergyUsageReport extends StatelessWidget {
  static const String routeName = '/energy-usage';
  const EnergyUsageReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Energy Report'), backgroundColor: const Color(0xFF0F172A), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildTotalUsage(),
            const SizedBox(height: 32),
            _buildDeviceBreakdown(),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalUsage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(32)),
      child: Column(
        children: [
           const Text('Total Consumption', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
           const Text('145 kWh', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
           Text('12% lower than last month', style: TextStyle(color: Colors.green[700], fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildDeviceBreakdown() {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         const Text('Heavy Users', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
         const SizedBox(height: 16),
         _usageRow('Air Conditioner', '45%', Colors.blue),
         _usageRow('Water Heater', '30%', Colors.orange),
         _usageRow('Kitchen Appliances', '15%', Colors.green),
       ],
     );
  }

  Widget _usageRow(String label, String pct, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(fontWeight: FontWeight.bold)), Text(pct, style: TextStyle(color: color, fontWeight: FontWeight.bold))]),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: double.parse(pct.replaceAll('%', '')) / 100, backgroundColor: Colors.grey[100], color: color, minHeight: 8, borderRadius: BorderRadius.circular(4)),
        ],
      ),
    );
  }
}
