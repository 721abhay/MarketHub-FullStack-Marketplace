import 'package:markethub/features/finance/screens/crypto_vault_screen.dart';
import 'package:markethub/features/finance/screens/insurance_screen.dart';
import 'package:markethub/features/finance/screens/stock_tracker_screen.dart';
import 'package:flutter/material.dart';

class FinanceHomeScreen extends StatelessWidget {
  static const String routeName = '/finance-home';
  const FinanceHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          _buildNetWorthCard(),
          _buildQuickActions(context),
          _buildSectionHeader('Markets'),
          _buildMarketOverview(),
          _buildSectionHeader('Financial Services'),
          _buildServiceList(context),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xFF1E293B),
      pinned: true,
      expandedHeight: 80,
      title: const Text('Finance Hub', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      actions: [
        IconButton(icon: const Icon(Icons.security_rounded, color: Colors.white70), onPressed: () {}),
      ],
    );
  }

  Widget _buildNetWorthCard() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF334155), Color(0xFF0F172A)]),
          borderRadius: BorderRadius.circular(32),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 20, offset: const Offset(0, 10))],
        ),
        child: const Column(
          children: [
            Text('Estimated Net Worth', style: TextStyle(color: Colors.white60, fontSize: 13, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('\$42,850.00', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.trending_up, color: Colors.greenAccent, size: 16),
                SizedBox(width: 4),
                Text('+2.4% Today', style: TextStyle(color: Colors.greenAccent, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildActionIcon(Icons.add_card_rounded, 'Pay Bills'),
            _buildActionIcon(Icons.send_rounded, 'Transfer'),
            _buildActionIcon(Icons.qr_code_scanner_rounded, 'Scan Pay'),
            _buildActionIcon(Icons.more_horiz_rounded, 'More'),
          ],
        ),
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
          child: Icon(icon, color: const Color(0xFF6366F1)),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
        child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
      ),
    );
  }

  Widget _buildMarketOverview() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            _buildMarketCard('S&P 500', '4,780.20', '+0.45%', true),
            _buildMarketCard('Bitcoin', '\$44,200', '-1.20%', false),
            _buildMarketCard('Gold', '\$2,050', '+0.15%', true),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketCard(String name, String val, String change, bool isUp) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
          const Spacer(),
          Text(val, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          Text(change, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: isUp ? Colors.green : Colors.red)),
        ],
      ),
    );
  }

  Widget _buildServiceList(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          _buildServiceTile(Icons.trending_up_rounded, 'Stock Market', 'Invest in global equities', () => Navigator.pushNamed(context, StockTrackerScreen.routeName)),
          _buildServiceTile(Icons.currency_bitcoin_rounded, 'Crypto Vault', 'Trade & Store digital assets', () => Navigator.pushNamed(context, CryptoVaultScreen.routeName)),
          _buildServiceTile(Icons.umbrella_rounded, 'Insurance', 'Protect your life and assets', () => Navigator.pushNamed(context, InsuranceCenterScreen.routeName)),
        ]),
      ),
    );
  }

  Widget _buildServiceTile(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFFEEF2FF), borderRadius: BorderRadius.circular(14)), child: Icon(icon, color: const Color(0xFF6366F1))),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
