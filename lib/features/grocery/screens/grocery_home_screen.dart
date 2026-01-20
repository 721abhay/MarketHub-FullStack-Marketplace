import 'package:markethub/features/account/screens/coupons_screen.dart';
import 'package:markethub/features/grocery/screens/grocery_category_screen.dart';
import 'package:markethub/features/grocery/screens/milk_subscription_screen.dart';
import 'package:markethub/features/grocery/screens/slot_booking_screen.dart';
import 'package:markethub/features/grocery/screens/order_tracking_screen.dart';
import 'package:markethub/features/shopping_list/screens/shopping_list_screen.dart';
import 'package:markethub/features/grocery/services/grocery_services.dart';
import 'package:markethub/models/service_models.dart';
import 'package:markethub/common/widgets/loader.dart';
import 'package:flutter/material.dart';

class GroceryHomeScreen extends StatefulWidget {
  static const String routeName = '/grocery-home';
  const GroceryHomeScreen({super.key});

  @override
  State<GroceryHomeScreen> createState() => _GroceryHomeScreenState();
}

class _GroceryHomeScreenState extends State<GroceryHomeScreen> {
  final GroceryServices groceryServices = GroceryServices();
  List<GroceryDeal>? groceryDeals;

  @override
  void initState() {
    super.initState();
    fetchGroceryDeals();
  }

  void fetchGroceryDeals() async {
    groceryDeals = await groceryServices.fetchGroceryDeals(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FDF4),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          _buildBanner(),
          _buildLiveTracking(context),
          _buildQuickActions(context),
          _buildSectionHeader('Shop by Category'),
          _buildCategoryGrid(context),
          _buildSectionHeader('Deals of the Day'),
          groceryDeals == null
              ? const SliverToBoxAdapter(child: Loader())
              : _buildProductList(),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            Navigator.pushNamed(context, SlotBookingScreen.routeName),
        backgroundColor: const Color(0xFF16A34A),
        icon: const Icon(Icons.timer_outlined, color: Colors.white),
        label: const Text('Book Delivery Slot',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      pinned: true,
      backgroundColor: const Color(0xFF16A34A),
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('MarketHub Fresh',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF16A34A), Color(0xFF22C55E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {}),
        IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {}),
      ],
    );
  }

  Widget _buildBanner() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(16),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&q=80&w=1000'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.black.withValues(alpha: 0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('FRESH HARVEST',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              Text('Up to 40% off on Organic Vegetables',
                  style: TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLiveTracking(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, OrderTrackingScreen.routeName),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF16A34A),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF16A34A).withValues(alpha: 0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 8))
            ],
          ),
          child: const Row(
            children: [
              CircleAvatar(
                  backgroundColor: Colors.white24,
                  child:
                      Icon(Icons.delivery_dining_rounded, color: Colors.white)),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Live Order Tracking',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    Text('Arriving in 12 mins • John is nearby',
                        style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildActionItem(Icons.history, 'Buy Again', () {}),
            _buildActionItem(Icons.list_alt, 'List Shop', () {
              Navigator.pushNamed(context, ShoppingListScreen.routeName);
            }),
            _buildActionItem(Icons.subscriptions, 'Milk Sub', () {
              Navigator.pushNamed(context, MilkSubscriptionScreen.routeName);
            }),
            _buildActionItem(Icons.local_offer_outlined, 'Coupons', () {
              Navigator.pushNamed(context, CouponsScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10)
                ]),
            child: Icon(icon, color: const Color(0xFF16A34A)),
          ),
          const SizedBox(height: 8),
          Text(label,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('See All',
                style: TextStyle(
                    color: Color(0xFF16A34A), fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(BuildContext context) {
    final categories = [
      {
        'name': 'Fruits',
        'image': 'https://cdn-icons-png.flaticon.com/512/3194/3194591.png'
      },
      {
        'name': 'Dairy',
        'image': 'https://cdn-icons-png.flaticon.com/512/2674/2674486.png'
      },
      {
        'name': 'Vegetables',
        'image': 'https://cdn-icons-png.flaticon.com/512/2329/2329903.png'
      },
      {
        'name': 'Meats',
        'image': 'https://cdn-icons-png.flaticon.com/512/1046/1046769.png'
      },
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.5,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(
                  context, GroceryCategoryScreen.routeName,
                  arguments: categories[index]['name']),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 10)
                    ]),
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(categories[index]['name']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)))),
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.network(categories[index]['image']!,
                            height: 40)),
                  ],
                ),
              ),
            );
          },
          childCount: categories.length,
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final deal = groceryDeals![index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                        'https://images.unsplash.com/photo-1518843875459-f738682238a6?auto=format&fit=crop&q=80&w=200',
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${deal.name} (${deal.unit})',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text(deal.discount,
                            style: const TextStyle(
                                color: Color(0xFF16A34A),
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('\$${deal.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF16A34A))),
                      ],
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.add_circle,
                          color: Color(0xFF16A34A), size: 32),
                      onPressed: () {}),
                ],
              ),
            );
          },
          childCount: groceryDeals!.length,
        ),
      ),
    );
  }
}

