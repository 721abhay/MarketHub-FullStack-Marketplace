import 'package:flutter/material.dart';

class SmartHomeDashboard extends StatelessWidget {
  static const String routeName = '/smart-home';
  const SmartHomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(title: const Text('Smart Home'), backgroundColor: Colors.transparent, foregroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildEnvironmentBanner(),
            const SizedBox(height: 32),
            _buildDeviceGrid(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, backgroundColor: Colors.blueAccent, child: const Icon(Icons.add, color: Colors.white)),
    );
  }

  Widget _buildEnvironmentBanner() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(32), border: Border.all(color: Colors.white10)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _EnvItem(Icons.thermostat, '22°C', 'Indoor'),
          _EnvItem(Icons.water_drop, '45%', 'Humidity'),
          _EnvItem(Icons.air, 'Clean', 'Air Quality'),
        ],
      ),
    );
  }

  Widget _buildDeviceGrid() {
    final devices = [
       {'name': 'Living Room Light', 'icon': Icons.lightbulb, 'status': 'ON', 'color': Colors.amber},
       {'name': 'Air Purifier', 'icon': Icons.air, 'status': 'Active', 'color': Colors.blue},
       {'name': 'Smart Lock', 'icon': Icons.lock, 'status': 'Locked', 'color': Colors.green},
       {'name': 'Security Camera', 'icon': Icons.videocam, 'status': 'Live', 'color': Colors.red},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 1.1),
      itemCount: devices.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(devices[index]['icon'] as IconData, color: devices[index]['color'] as Color),
              const Spacer(),
              Text(devices[index]['name'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 4),
              Text(devices[index]['status'] as String, style: TextStyle(color: (devices[index]['color'] as Color).withValues(alpha: 0.8), fontSize: 11, fontWeight: FontWeight.bold)),
            ],
          ),
        );
      },
    );
  }
}

class _EnvItem extends StatelessWidget {
  final IconData icon;
  final String val;
  final String label;
  const _EnvItem(this.icon, this.val, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(children: [Icon(icon, color: Colors.blueAccent, size: 28), const SizedBox(height: 12), Text(val, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)), Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11))]);
  }
}
