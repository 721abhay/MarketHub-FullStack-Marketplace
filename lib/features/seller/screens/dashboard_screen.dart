import 'dart:ui';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/common/widgets/glass_container.dart';
import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/seller/screens/seller_payout_screen.dart';
import 'package:amazon_clone/features/seller/services/seller_services.dart';
import 'package:amazon_clone/features/seller/screens/seller_orders_screen.dart'; // Added
import 'package:amazon_clone/features/seller/screens/coupons_manager_screen.dart'; // Added
import 'package:amazon_clone/features/seller/screens/seller_analytics_screen.dart'; 
import 'package:amazon_clone/features/seller/screens/inventory_report_screen.dart'; 
import 'package:amazon_clone/features/seller/screens/campaign_manager_screen.dart'; 
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerDashboardScreen extends StatefulWidget {
  const SellerDashboardScreen({super.key});

  @override
  State<SellerDashboardScreen> createState() => _SellerDashboardScreenState();
}

class _SellerDashboardScreenState extends State<SellerDashboardScreen> {
  Map<String, dynamic>? analytics;
  final SellerServices sellerServices = SellerServices();

  @override
  void initState() {
    super.initState();
    getAnalytics();
  }

  Future<void> getAnalytics() async {
    final data = await sellerServices.getAnalytics(context);
    setState(() {
      analytics = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    return analytics == null
        ? const Loader()
        : Scaffold(
            backgroundColor: const Color(0xFFF8FAFC),
            extendBodyBehindAppBar: true,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: AppBar(
                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                    elevation: 0,
                    title: const Text(
                      'MarketHub Intelligence',
                      style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF6366F1).withValues(alpha: 0.1),
                    const Color(0xFFF8FAFC),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopStats(user),
                    const SizedBox(height: 32),
                    _buildHeatmapSection(),
                    const SizedBox(height: 32),
                    _buildInventoryIntelligence(),
                    const SizedBox(height: 32),
                    _buildQuickAction(context),
                  ],
                ),
              ),
            ),
          );
  }

  Widget _buildTopStats(User user) {
    return Row(
      children: [
        Expanded(
          child: GlassContainer(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.account_balance_wallet_rounded, color: Color(0xFF6366F1)),
                const SizedBox(height: 12),
                Text('\$${user.wallet.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text('Wallet Balance', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, SellerPayoutScreen.routeName),
                  child: const Text('Withdraw Funds →', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 11)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GlassContainer(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.shopping_bag_rounded, color: Color(0xFF06B6D4)),
                const SizedBox(height: 12),
                Text('${analytics!['totalOrders']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text('Total Orders', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                const SizedBox(height: 12),
                Text('${analytics!['totalProducts']} Live Products', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeatmapSection() {
    final regions = analytics!['topRegions'] as List<dynamic>;
    if (regions.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Sales Heatmap', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        const SizedBox(height: 16),
        GlassContainer(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: regions.map((region) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_rounded, color: Color(0xFFEF4444), size: 18),
                    const SizedBox(width: 12),
                    Expanded(child: Text(region['name'], style: const TextStyle(fontWeight: FontWeight.w500))),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFFEEF2FF), borderRadius: BorderRadius.circular(10)),
                      child: Text('${region['count']} Orders', style: const TextStyle(color: Color(0xFF6366F1), fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildInventoryIntelligence() {
    final insights = analytics!['inventoryInsights'] as List<dynamic>;
    if (insights.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Inventory AI', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: const Color(0xFF10B981).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
              child: const Text('SMART PREDICTIONS', style: TextStyle(color: Color(0xFF059669), fontSize: 9, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          children: insights.map((p) {
            Color statusColor = const Color(0xFF10B981);
            if (p['status'] == 'critical') statusColor = const Color(0xFFEF4444);
            if (p['status'] == 'warning') statusColor = const Color(0xFFF59E0B);

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(p['name'], style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        Text('Velocity: ${p['velocity']} units / day', style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${p['daysLeft']} Days Left', style: TextStyle(fontWeight: FontWeight.bold, color: statusColor, fontSize: 13)),
                      const Text('EST. STOCK OUT', style: TextStyle(fontSize: 9, color: Color(0xFF94A3B8))),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildQuickAction(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pro Tools',
           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildProToolCard(
                  'Analytics', 
                  Icons.analytics_rounded, 
                  Colors.purple, 
                  () => Navigator.pushNamed(context, SellerAnalyticsScreen.routeName),
                ),
                 const SizedBox(width: 12),
                 _buildProToolCard(
                  'Inventory', 
                  Icons.inventory_2_rounded, 
                  Colors.orange, 
                  () => Navigator.pushNamed(context, InventoryReportScreen.routeName),
                ),
                 const SizedBox(width: 12),
                 _buildProToolCard(
                  'Campaigns', 
                  Icons.campaign_rounded, 
                  Colors.blue, 
                  () => Navigator.pushNamed(context, CampaignManagerScreen.routeName),
                ),
                const SizedBox(width: 12),
                 _buildProToolCard(
                  'Orders', 
                  Icons.list_alt_rounded, 
                  Colors.green, 
                  () => Navigator.pushNamed(context, SellerOrdersScreen.routeName),
                ),
                const SizedBox(width: 12),
                 _buildProToolCard(
                  'Coupons', 
                  Icons.local_offer_rounded, 
                  Colors.pink, 
                  () => Navigator.pushNamed(context, CouponsManagerScreen.routeName),
                ),
              ],
            ),
        ),
      ],
    );
  }

  Widget _buildProToolCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
       child: Container(
         width: 100,
         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(16),
           boxShadow: [
             BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
           ],
         ),
         child: Column(
           children: [
             Container(
               padding: const EdgeInsets.all(12),
               decoration: BoxDecoration(
                 color: color.withValues(alpha: 0.1),
                 shape: BoxShape.circle,
               ),
               child: Icon(icon, color: color, size: 24),
             ),
             const SizedBox(height: 12),
             Text(
               title,
               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1E293B)),
             ),
           ],
         ),
       ),
    );
  }
}
