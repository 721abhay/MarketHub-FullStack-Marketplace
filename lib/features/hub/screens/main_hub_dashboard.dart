import 'dart:ui';
import 'package:amazon_clone/features/hub/screens/plus_subscription_screen.dart';
import 'package:amazon_clone/features/hub/screens/qr_scanner_screen.dart';
import 'package:amazon_clone/features/hub/screens/universal_ai_search_screen.dart';
import 'package:amazon_clone/features/account/screens/wallet_screen.dart';
import 'package:flutter/material.dart';

class MainHubDashboard extends StatelessWidget {
  static const String routeName = '/hub-dashboard';
  const MainHubDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          // Background Glow
          Positioned(top: -150, left: -50, child: Container(width: 400, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.indigo.withValues(alpha: 0.1)))),
          
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildAppBar(context),
              _buildRewardsHeader(context),
              _buildCategoryShortcuts(context),
              _buildSectionTitle('Super App Verticals'),
              _buildVerticalGrid(context),
              _buildSectionTitle('MarketHub Elite'),
              _buildEliteBanner(context),
              _buildSectionTitle('Interactive Hub'),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1.1),
                  delegate: SliverChildListDelegate([
                    _buildHubFeatureCard(context, Icons.generating_tokens_rounded, 'Rewards', '2,450 Points', Colors.amber),
                    _buildHubFeatureCard(context, Icons.qr_code_scanner_rounded, 'Pay/Scan', 'Merchant Pay', Colors.blue),
                    _buildHubFeatureCard(context, Icons.auto_graph_rounded, 'Activity', 'Your Insights', Colors.green),
                    _buildHubFeatureCard(context, Icons.help_outline_rounded, 'Suppport', '24/7 AI Chat', Colors.purple),
                  ]),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 120,
      backgroundColor: Colors.white.withValues(alpha: 0.8),
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('MarketHub', style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: false,
        titlePadding: const EdgeInsets.only(left: 24, bottom: 16),
      ),
      actions: [
        IconButton(icon: const Icon(Icons.search_rounded, color: Colors.black87), onPressed: () => Navigator.pushNamed(context, UniversalAISearchScreen.routeName)),
        IconButton(icon: const Icon(Icons.qr_code_scanner_rounded, color: Colors.black87), onPressed: () => Navigator.pushNamed(context, QRScannerScreen.routeName)),
        const SizedBox(width: 12),
        const CircleAvatar(radius: 18, backgroundImage: NetworkImage('https://images.unsplash.com/photo-1547032132-bc0cc79e782f?auto=format&fit=crop&q=80&w=100')),
        const SizedBox(width: 24),
      ],
    );
  }

  Widget _buildRewardsHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [const Color(0xFF6366F1), const Color(0xFF8B5CF6).withValues(alpha: 0.9)]),
                boxShadow: [BoxShadow(color: Colors.indigo.withValues(alpha: 0.3), blurRadius: 30, offset: const Offset(0, 15))],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Unified Balance', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                          const SizedBox(height: 8),
                          const Text('\$14,250.60', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(context, WalletScreen.routeName),
                          child: const Text('Add Money', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Colors.white24),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _headerStat('Coins', '450'),
                      _headerStat('Cashback', '\$12.5'),
                      _headerStat('Rank', '#12'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerStat(String label, String value) {
    return Column(children: [Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)), Text(label, style: const TextStyle(color: Colors.white60, fontSize: 11))]);
  }

  Widget _buildCategoryShortcuts(BuildContext context) {
    final icons = [{'n': 'Pay', 'i': Icons.send_rounded}, {'n': 'Bills', 'i': Icons.receipt_long_rounded}, {'n': 'TopUp', 'i': Icons.phone_android_rounded}, {'n': 'Safe', 'i': Icons.security_rounded}];
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: icons.map((ic) => Column(
            children: [
              Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10)]), child: Icon(ic['i'] as IconData, color: Colors.indigoAccent)),
              const SizedBox(height: 10),
              Text(ic['n'] as String, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF64748B))),
            ],
          )).toList(),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return SliverPadding(padding: const EdgeInsets.fromLTRB(24, 40, 24, 16), sliver: SliverToBoxAdapter(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)))));
  }

  Widget _buildVerticalGrid(BuildContext context) {
    final verticals = [
      {'name': 'Shopping', 'desc': 'Best Products', 'icon': Icons.shopping_basket_rounded, 'color': Colors.blue, 'route': '/home'},
      {'name': 'Grocery', 'desc': 'Fresh Items', 'icon': Icons.local_grocery_store_rounded, 'color': Colors.green, 'route': '/grocery-home'},
      {'name': 'Travel', 'desc': 'Book Flights', 'icon': Icons.flight_rounded, 'color': Colors.indigo, 'route': '/travel-home'},
      {'name': 'Careers', 'desc': 'Dream Jobs', 'icon': Icons.work_rounded, 'color': Colors.orange, 'route': '/jobs-home'},
      {'name': 'Properties', 'desc': 'Buy/Rent', 'icon': Icons.home_work_rounded, 'color': Colors.deepPurple, 'route': '/real-estate-home'},
      {'name': 'Events', 'desc': 'Book Tickets', 'icon': Icons.confirmation_number_rounded, 'color': Colors.pink, 'route': '/events-home'},
    ];
    
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 1.4),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final v = verticals[index];
            return InkWell(
              onTap: () => Navigator.pushNamed(context, v['route'] as String),
              borderRadius: BorderRadius.circular(24),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: (v['color'] as Color).withValues(alpha: 0.05), borderRadius: BorderRadius.circular(24), border: Border.all(color: (v['color'] as Color).withValues(alpha: 0.1))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(v['icon'] as IconData, color: v['color'] as Color),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(v['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)), Text(v['desc'] as String, style: TextStyle(color: (v['color'] as Color).withValues(alpha: 0.6), fontSize: 10))]),
                  ],
                ),
              ),
            );
          },
          childCount: verticals.length,
        ),
      ),
    );
  }

  Widget _buildEliteBanner(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF1E293B), Color(0xFF334155)]), borderRadius: BorderRadius.circular(24)),
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('MARKETHUB PLUS', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 1)),
                    SizedBox(height: 8),
                    Text('Unlock Premium Benefits', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 4),
                    Text('Free deliveries & Priority Support', style: TextStyle(color: Colors.white54, fontSize: 12)),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () => Navigator.pushNamed(context, MarketHubPlusScreen.routeName), style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Join', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHubFeatureCard(BuildContext context, IconData icon, String title, String sub, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle), child: Icon(icon, color: color, size: 24)),
          const Spacer(),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Text(sub, style: TextStyle(color: Colors.grey[400], fontSize: 11)),
        ],
      ),
    );
  }
}
