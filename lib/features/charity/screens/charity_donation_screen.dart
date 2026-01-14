import 'package:flutter/material.dart';

class CharityDonationScreen extends StatelessWidget {
  static const String routeName = '/charity-donations';
  const CharityDonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7ED), // Soft orange
      appBar: AppBar(title: const Text('MarketHub Smile'), backgroundColor: Colors.orange[800], foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImpactBanner(),
            const SizedBox(height: 32),
            const Text('Donate at Checkout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildDonationToggle(),
            const SizedBox(height: 32),
             const Text('Select Your Charity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
             const SizedBox(height: 16),
             _buildCharityItem('World Wildlife Fund', 'Conserving nature for future generations.', 'https://wwf.org/logo.png'),
             _buildCharityItem('Children First', 'Education and health for every child.', 'https://child.org/logo.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactBanner() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.orange.withValues(alpha: 0.05), blurRadius: 20)]),
      child: Column(
        children: [
          Icon(Icons.volunteer_activism, size: 40, color: Colors.orange[800]),
          const SizedBox(height: 16),
          const Text('Your Impact', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const Text('You have helped raise \$45.00 for charity this year by shopping with us.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildDonationToggle() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Round up to Charity', style: TextStyle(fontWeight: FontWeight.bold)), Text('Round up every purchase to the next dollar to donate.', style: TextStyle(color: Colors.grey, fontSize: 12))])),
          Switch(value: true, onChanged: (v) {}, activeThumbColor: Colors.orange[800]),
        ],
      ),
    );
  }

  Widget _buildCharityItem(String name, String desc, String img) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(height: 50, width: 50, decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.business, color: Colors.orange)),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(fontWeight: FontWeight.bold)), Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 12))])),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}
