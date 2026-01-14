import 'package:flutter/material.dart';

class MarketHubPlusScreen extends StatelessWidget {
  static const String routeName = '/plus-subscription';
  const MarketHubPlusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildHero(),
          _buildBenefits(),
          _buildPlans(),
          const SliverToBoxAdapter(child: SizedBox(height: 50)),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: const Color(0xFF1E293B),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF6366F1), Color(0xFF4338CA)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.stars_rounded, color: Colors.amber, size: 80),
              SizedBox(height: 16),
              Text('MarketHub PLUS', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              Text('Unlock Premium Shopping Benefits', style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefits() {
    return SliverPadding(
      padding: const EdgeInsets.all(24),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          const Text('Subscription Benefits', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          _benefitRow(Icons.local_shipping_rounded, 'Free Unlimited Delivery', 'On all orders above \$10'),
          _benefitRow(Icons.timer_rounded, 'Priority Shipping', 'Get your items delivered 50% faster'),
          _benefitRow(Icons.support_agent_rounded, '24/7 Priority Support', 'Dedicated line for Plus members'),
          _benefitRow(Icons.percent_rounded, 'Exclusive Deals', 'Access to sales 24 hours earlier'),
        ]),
      ),
    );
  }

  Widget _benefitRow(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: const Color(0xFFEEF2FF), child: Icon(icon, color: const Color(0xFF6366F1))),
          const SizedBox(width: 20),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 12))])),
        ],
      ),
    );
  }

  Widget _buildPlans() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: [
             const Text('Choose Your Plan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
             const SizedBox(height: 24),
             _planCard('Annual', '\$99/year', 'Save \$45', true),
             const SizedBox(height: 12),
             _planCard('Monthly', '\$12/month', 'Cancel anytime', false),
          ],
        ),
      ),
    );
  }

  Widget _planCard(String title, String price, String sub, bool isBest) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: isBest ? Border.all(color: const Color(0xFF6366F1), width: 2) : null),
      child: Row(
        children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 12))])),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF6366F1))),
        ],
      ),
    );
  }
}
