import 'package:flutter/material.dart';

class SustainabilityReportScreen extends StatelessWidget {
  static const String routeName = '/sustainability-hub';
  const SustainabilityReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FDF4), // Very light green
      appBar: AppBar(
        title: const Text('Sustainability Hub', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildImpactBanner(),
            const SizedBox(height: 32),
            _buildActionGrid(),
            const SizedBox(height: 32),
            _buildCommunitySection(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactBanner() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF16A34A), Color(0xFF15803D)]),
        borderRadius: BorderRadius.circular(32),
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.eco_rounded, color: Colors.white, size: 40),
              SizedBox(width: 16),
              Text('Your Impact', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 24),
          Text('124 kg', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
          Text('CO2 Emissions Saved', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Divider(color: Colors.white24),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ImpactStat('12', 'Trees Planted'),
              _ImpactStat('45', 'Eco Shipments'),
              _ImpactStat('3kg', 'Recycled'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        _buildActionCard('Green Delivery', Icons.electric_car_rounded, 'Choose EV delivery'),
        _buildActionCard('Refill Store', Icons.shopping_bag_rounded, 'Eco-friendly packaging'),
        _buildActionCard('Recycle Program', Icons.auto_delete_rounded, 'Return old gadgets'),
        _buildActionCard('Donate Items', Icons.volunteer_activism_rounded, 'Give to local charities'),
      ],
    );
  }

  Widget _buildActionCard(String title, IconData icon, String desc) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.green.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF16A34A), size: 28),
          const Spacer(),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildCommunitySection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(border: Border.all(color: const Color(0xFFDCFCE7)), borderRadius: BorderRadius.circular(24), color: Colors.white),
      child: Column(
        children: [
          const Text('Community Green Leaderboard', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 20),
          _leaderboardRow('1', 'Green Hero #1', '450 pts'),
          _leaderboardRow('2', 'Eco Warrior', '380 pts'),
          _leaderboardRow('3', 'Sustainable Sam', '310 pts'),
        ],
      ),
    );
  }

  Widget _leaderboardRow(String rank, String name, String pts) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(rank, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(width: 16),
          const CircleAvatar(radius: 12, backgroundColor: Color(0xFFDCFCE7), child: Icon(Icons.person, size: 12, color: Color(0xFF16A34A))),
          const SizedBox(width: 12),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Spacer(),
          Text(pts, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF16A34A))),
        ],
      ),
    );
  }
}

class _ImpactStat extends StatelessWidget {
  final String val;
  final String label;
  const _ImpactStat(this.val, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(val, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)), Text(label, style: const TextStyle(color: Colors.white60, fontSize: 10))]);
  }
}
