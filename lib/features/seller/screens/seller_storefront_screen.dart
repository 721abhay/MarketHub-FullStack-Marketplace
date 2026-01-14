import 'package:flutter/material.dart';

class SellerStorefrontScreen extends StatelessWidget {
  static const String routeName = '/seller-storefront';
  final String sellerName;
  const SellerStorefrontScreen({super.key, required this.sellerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildSellerHeader(),
          _buildTabs(),
          _buildProductGrid(),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: const Color(0xFF1E293B),
      title: Text(sellerName, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      actions: [IconButton(icon: const Icon(Icons.share, color: Colors.white), onPressed: () {})],
    );
  }

  Widget _buildSellerHeader() {
    return SliverToBoxAdapter(
      child: Container(
        color: const Color(0xFF1E293B),
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white10,
              child: Icon(Icons.storefront_rounded, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text('4.8/5.0 (2,450 Ratings)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(20)),
              child: const Text('Top Rated Seller', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        Container(
          color: Colors.white,
          child: const TabBar(
            labelColor: Color(0xFF6366F1),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF6366F1),
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'All Products'),
              Tab(text: 'Reviews'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 0.7),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFE2E8F0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(20)), child: Image.network('https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&q=80&w=400', fit: BoxFit.cover))),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Premium Sneaker', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        const Text('\$129.99', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 12),
                            const SizedBox(width: 4),
                            Text('4.5', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          childCount: 6,
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Container _tabBar;

  @override
  double get minExtent => 48;
  @override
  double get maxExtent => 48;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
