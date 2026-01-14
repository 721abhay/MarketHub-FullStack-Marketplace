import 'package:flutter/material.dart';

class GiftCardsHomeScreen extends StatelessWidget {
  static const String routeName = '/gift-cards';
  const GiftCardsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Gift Cards'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 32),
            const Text('Shop Gift Cards', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildGiftCardCategories(),
            const SizedBox(height: 32),
            const Text('Popular Occasions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildOccasionGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF6366F1), Color(0xFF4F46E5)]), borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Your Gift Card Balance', style: TextStyle(color: Colors.white70)),
          const Text('\$145.20', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildBalanceAction('Redeem Card', Icons.add_circle_outline),
              const SizedBox(width: 12),
              _buildBalanceAction('Reload', Icons.refresh),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceAction(String label, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: Colors.white, size: 16), const SizedBox(width: 8), Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))]),
      ),
    );
  }

  Widget _buildGiftCardCategories() {
    final cats = [
       {'name': 'e-Gift Cards', 'icon': Icons.mail_outline},
       {'name': 'Physical Cards', 'icon': Icons.credit_card},
       {'name': 'For Businesses', 'icon': Icons.business_center_outlined},
    ];
    return Row(
      children: cats.map((c) => Expanded(
        child: Column(
          children: [
            CircleAvatar(backgroundColor: Colors.blue[50], child: Icon(c['icon'] as IconData, color: const Color(0xFF6366F1))),
            const SizedBox(height: 8),
            Text(c['name'] as String, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildOccasionGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.6, mainAxisSpacing: 12, crossAxisSpacing: 12),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), image: const DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1549463510-2b63ea993f39?auto=format&fit=crop&q=80&w=300'), fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.black26),
            child: const Center(child: Text('Birthday', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          ),
        );
      },
    );
  }
}
