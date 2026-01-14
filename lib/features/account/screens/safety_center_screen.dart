import 'package:flutter/material.dart';

class SafetyCenterScreen extends StatelessWidget {
  static const String routeName = '/safety-center';
  const SafetyCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Safety & Privacy', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1E293B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSecurityScore(),
            const SizedBox(height: 32),
            _buildSection('Account Protection', [
              _buildSafetyTile(Icons.lock_person_rounded, 'Two-Step Verification', 'Active', Colors.green),
              _buildSafetyTile(Icons.devices_rounded, 'Manage Devices', '3 devices logged in', Colors.blue),
              _buildSafetyTile(Icons.password_rounded, 'Change Password', 'Last changed 3 months ago', Colors.grey),
            ]),
            const SizedBox(height: 32),
            _buildSection('Emergency & Help', [
              _buildSafetyTile(Icons.sos_rounded, 'Emergency SOS', 'Setup emergency contacts', Colors.red),
              _buildSafetyTile(Icons.shield_outlined, 'Safety Tips', 'How to shop securely', Colors.orange),
              _buildSafetyTile(Icons.report_problem_outlined, 'Report a Scam', 'Immediate incident reporting', Colors.redAccent),
            ]),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityScore() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF334155), Color(0xFF1E293B)]),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          const Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(width: 80, height: 80, child: CircularProgressIndicator(value: 0.85, strokeWidth: 8, color: Colors.greenAccent, backgroundColor: Colors.white10)),
              Text('85%', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Your Security Score', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const Text('Great progress! Complete 2 more steps to reaching 100%.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white60, fontSize: 12)),
          const SizedBox(height: 24),
          TextButton(onPressed: () {}, style: TextButton.styleFrom(foregroundColor: Colors.greenAccent), child: const Text('Improve Score', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 12),
          child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF64748B))),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: const Color(0xFFE2E8F0))),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildSafetyTile(IconData icon, String title, String subtitle, Color color) {
    return ListTile(
      leading: Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: color, size: 22)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
      onTap: () {},
    );
  }
}
