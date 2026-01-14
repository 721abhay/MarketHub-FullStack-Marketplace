import 'dart:ui';
import 'package:markethub/features/hub/screens/plus_subscription_screen.dart';
import 'package:markethub/features/hub/screens/qr_scanner_screen.dart';
import 'package:markethub/features/hub/screens/universal_ai_search_screen.dart';
import 'package:markethub/features/account/screens/wallet_screen.dart';
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
          // Dynamic Background Elements
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6366F1).withValues(alpha: 0.08),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          
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
              _buildSectionTitle('Market Dynamics'),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                  ),
                  delegate: SliverChildListDelegate([
                    _buildHubFeatureCard(context, Icons.generating_tokens_rounded, 'Rewards', '2,450 Points', Colors.amber),
                    _buildHubFeatureCard(context, Icons.qr_code_scanner_rounded, 'Pay & Scan', 'Merchant Pay', const Color(0xFF0EA5E9)),
                    _buildHubFeatureCard(context, Icons.auto_graph_rounded, 'Insights', 'Your Activity', const Color(0xFF10B981)),
                    _buildHubFeatureCard(context, Icons.auto_awesome_rounded, 'AI Concierge', '24/7 Support', const Color(0xFFA855F7)),
                  ]),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 120)),
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
      backgroundColor: Colors.white.withValues(alpha: 0.9),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          'MarketHub',
          style: TextStyle(
            color: Color(0xFF020617),
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: -1,
          ),
        ),
        centerTitle: false,
        titlePadding: const EdgeInsets.only(left: 24, bottom: 20),
      ),
      actions: [
        _AppBarButton(
          icon: Icons.search_rounded,
          onTap: () => Navigator.pushNamed(context, UniversalAISearchScreen.routeName),
        ),
        const SizedBox(width: 12),
        _AppBarButton(
          icon: Icons.qr_code_scanner_rounded,
          onTap: () => Navigator.pushNamed(context, QRScannerScreen.routeName),
        ),
        const SizedBox(width: 24),
      ],
    );
  }

  Widget _buildRewardsHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6366F1).withValues(alpha: 0.25),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Container(
              padding: const EdgeInsets.all(28),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'UNIFIED BALANCE',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '\$14,250.60',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add_rounded, color: Colors.white),
                          onPressed: () => Navigator.pushNamed(context, WalletScreen.routeName),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _headerStat('COINS', '4,500'),
                        _headerStat('CASHBACK', '\$12.50'),
                        _headerStat('RELIABILITY', '98%'),
                      ],
                    ),
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
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ],
    );
  }

  Widget _buildCategoryShortcuts(BuildContext context) {
    final shortcuts = [
       {'n': 'Pay', 'i': Icons.account_balance_wallet_rounded, 'c': const Color(0xFF6366F1)},
       {'n': 'Bills', 'i': Icons.description_rounded, 'c': const Color(0xFF10B981)},
       {'n': 'Travel', 'i': Icons.flight_takeoff_rounded, 'c': const Color(0xFFF59E0B)},
       {'n': 'Invest', 'i': Icons.trending_up_rounded, 'c': const Color(0xFFA855F7)},
    ];
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: shortcuts.map((ic) => _ShortcutItem(
            icon: ic['i'] as IconData,
            label: ic['n'] as String,
            color: ic['c'] as Color,
          )).toList(),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 20),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
                letterSpacing: -0.5,
              ),
            ),
            const Icon(Icons.arrow_forward_rounded, size: 18, color: Color(0xFF64748B)),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalGrid(BuildContext context) {
    final verticals = [
      {'name': 'Shopping', 'desc': 'Best Products', 'icon': Icons.shopping_bag_rounded, 'color': const Color(0xFF6366F1), 'r': '/home'},
      {'name': 'Grocery', 'desc': 'Cloud Kitchen', 'icon': Icons.restaurant_rounded, 'color': const Color(0xFF10B981), 'r': '/grocery-home'},
      {'name': 'Travel', 'desc': 'Experience', 'icon': Icons.explore_rounded, 'color': const Color(0xFFF43F5E), 'r': '/travel-home'},
      {'name': 'Careers', 'desc': 'Next Move', 'icon': Icons.badge_rounded, 'color': const Color(0xFF0EA5E9), 'r': '/jobs-home'},
      {'name': 'Estates', 'desc': 'Live Better', 'icon': Icons.holiday_village_rounded, 'color': const Color(0xFF8B5CF6), 'r': '/real-estate-home'},
      {'name': 'Events', 'desc': 'Nights Out', 'icon': Icons.confirmation_number_rounded, 'color': const Color(0xFFF59E0B), 'r': '/events-home'},
    ];
    
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final v = verticals[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: const Color(0xFFF1F5F9)),
                boxShadow: [
                  BoxShadow(
                    color: (v['color'] as Color).withValues(alpha: 0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, v['r'] as String),
                  borderRadius: BorderRadius.circular(28),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: (v['color'] as Color).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(v['icon'] as IconData, color: v['color'] as Color, size: 20),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(v['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: -0.3)),
                            const SizedBox(height: 2),
                            Text(v['desc'] as String, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
                          ],
                        ),
                      ],
                    ),
                  ),
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
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 25,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                bottom: -20,
                child: Icon(Icons.star_rounded, size: 120, color: Colors.white.withValues(alpha: 0.05)),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(8)),
                            child: const Text('PRO', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                          ),
                          const SizedBox(height: 16),
                          const Text('Elite Membership', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: -0.5)),
                          const SizedBox(height: 8),
                          const Text('Enjoy zero delivery fees and exclusive Hub access.', style: TextStyle(color: Colors.white60, fontSize: 13, height: 1.4)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                       decoration: BoxDecoration(
                         boxShadow: [
                           BoxShadow(color: Colors.amber.withValues(alpha: 0.3), blurRadius: 20, offset: const Offset(0, 5)),
                         ],
                       ),
                       child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, MarketHubPlusScreen.routeName), 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber, 
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ), 
                        child: const Text('Upgrade', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHubFeatureCard(BuildContext context, IconData icon, String title, String sub, Color color) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(32), 
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.05), 
            blurRadius: 20, 
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12), 
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1), 
              shape: BoxShape.circle,
            ), 
            child: Icon(icon, color: color, size: 22),
          ),
          const Spacer(),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: -0.3)),
          const SizedBox(height: 2),
          Text(sub, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _AppBarButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: const Color(0xFF0F172A), size: 20),
      ),
    );
  }
}

class _ShortcutItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _ShortcutItem({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18), 
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1), 
            borderRadius: BorderRadius.circular(20),
          ), 
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 12),
        Text(
          label, 
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF475569)),
        ),
      ],
    );
  }
}
