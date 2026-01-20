import 'package:markethub/features/account/screens/notifications_screen.dart';
import 'package:markethub/features/search/screens/visual_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/features/home/widgets/address_box.dart';
import 'package:markethub/features/home/widgets/carousel_image.dart';
import 'package:markethub/features/home/widgets/deal_of_day.dart';
import 'package:markethub/features/home/widgets/product_showcase.dart';
import 'package:markethub/features/home/widgets/top_categories.dart';
import 'package:markethub/features/search/screens/search_screen.dart';
import 'package:markethub/models/product.dart';
import 'package:markethub/features/social/screens/community_feed_screen.dart';
import 'package:markethub/providers/user_provider.dart';
import 'package:markethub/providers/localization_provider.dart';
import 'package:markethub/features/home/widgets/hub_preview.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query) {
    if (query.isNotEmpty) {
      Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
    }
  }

  final List<Product> phoneDeals = [
    Product(
      name: 'iPhone 15 Pro Max',
      description: 'The latest iPhone with A17 Pro chip',
      quantity: 10,
      images: ['https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?q=80&w=400&auto=format&fit=crop'],
      category: 'Mobiles',
      price: 1199,
      id: 'h1',
      rating: [],
    ),
    Product(
      name: 'Samsung Galaxy S24',
      description: 'The ultimate Android experience',
      quantity: 5,
      images: ['https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?q=80&w=400&auto=format&fit=crop'],
      category: 'Mobiles',
      price: 999,
      id: 'h2',
      rating: [],
    ),
    Product(
      name: 'Pixel 8 Pro',
      description: 'The best of Google AI',
      quantity: 8,
      images: ['https://images.unsplash.com/photo-1596742572145-164ae7d02947?q=80&w=400&auto=format&fit=crop'],
      category: 'Mobiles',
      price: 899,
      id: 'h3',
      rating: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    final localization = context.watch<LocalizationProvider>();

    List<Product> recentlyViewedProducts = [];
    for (int i = 0; i < user.recentlyViewed.length; i++) {
      if (user.recentlyViewed[i]['product'] != null) {
        recentlyViewedProducts.add(Product.fromMap(user.recentlyViewed[i]['product']));
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: RefreshIndicator(
        onRefresh: () async {
           // Simulate a refresh delay
           await Future.delayed(const Duration(seconds: 1));
           if (mounted) setState(() {});
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            pinned: true,
            elevation: 0,
            backgroundColor: const Color(0xFF6366F1),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: GlobalVariables.appBarGradient,
                ),
              ),
            ),
            title: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search_rounded, color: Colors.white70),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.camera_alt_outlined, color: Colors.white70),
                          onPressed: () => Navigator.pushNamed(context, VisualSearchScreen.routeName),
                        ),
                        hintText: localization.translate('search_hint'),
                        hintStyle: const TextStyle(fontSize: 14, color: Colors.white54),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                _HeaderIcon(
                  icon: Icons.people_alt_rounded,
                  onTap: () => Navigator.pushNamed(context, CommunityFeedScreen.routeName),
                ),
                const SizedBox(width: 8),
                _HeaderIcon(
                  icon: Icons.notifications_none_rounded,
                  onTap: () => Navigator.pushNamed(context, NotificationsScreen.routeName),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AddressBox(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${localization.translate('welcome')}, 👋',
                            style: const TextStyle(fontSize: 14, color: Color(0xFF64748B), fontWeight: FontWeight.w500),
                          ),
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xFF6366F1).withValues(alpha: 0.1),
                        child: const Icon(Icons.person_outline_rounded, color: Color(0xFF6366F1)),
                      ),
                    ],
                  ),
                ),
                const TopCategories(),
                const SizedBox(height: 12),
                const CarouselImage(),
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Explore Services',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A), letterSpacing: -0.5),
                  ),
                ),
                const SizedBox(height: 16),
                const HubPreview(),
                const SizedBox(height: 32),
                if (recentlyViewedProducts.isNotEmpty)
                  ProductShowcase(
                    title: 'Continue Browsing',
                    products: recentlyViewedProducts,
                  ),
                const DealOfDay(),
                ProductShowcase(
                  title: localization.translate('featured_deals'),
                  products: phoneDeals,
                ),
                const SizedBox(height: 48),
                _buildPersonalizedCard(),
                const SizedBox(height: 100),
              ],
            ),
          ),
          ],
        ),
      ),
      floatingActionButton: const _AISupportFAB(),
    );
  }

  Widget _buildPersonalizedCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF6366F1).withValues(alpha: 0.2),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 32),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(20)),
                child: const Text('FOR YOU', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Ready for a\nPersonalized Shop?',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, height: 1.1),
          ),
          const SizedBox(height: 12),
          const Text(
            'Unlock exclusive deals tailored specifically for your lifestyle and preferences.',
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF6366F1),
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Start Personalized Tour', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _HeaderIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white12),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

class _AISupportFAB extends StatelessWidget {
  const _AISupportFAB();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF6366F1).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/ai-chat'),
        backgroundColor: const Color(0xFF6366F1),
        label: const Text('AI Assistant', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        icon: const Icon(Icons.auto_awesome_rounded, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }
}
