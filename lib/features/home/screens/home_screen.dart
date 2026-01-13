import 'package:amazon_clone/features/account/screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/home/widgets/carousel_image.dart';
import 'package:amazon_clone/features/home/widgets/deal_of_day.dart';
import 'package:amazon_clone/features/home/widgets/product_showcase.dart';
import 'package:amazon_clone/features/home/widgets/top_categories.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/providers/localization_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  // Showcase Products (Mock/Fallbacks)
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

    // Map recently viewed to Product objects
    List<Product> recentlyViewedProducts = user.recentlyViewed.map((item) {
      return Product.fromMap(item['product']);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    onFieldSubmitted: navigateToSearchScreen,
                    decoration: const InputDecoration(
                      prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF6366F1)),
                      hintText: localization.translate('search_hint'),
                      hintStyle: const TextStyle(fontSize: 15, color: Color(0xFF94A3B8)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, NotificationsScreen.routeName),
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: const Icon(Icons.notifications_none_rounded, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const AddressBox(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${localization.translate('welcome')},',
                    style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
                  ),
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
            const TopCategories(),
            const SizedBox(height: 10),
            const CarouselImage(),
            const SizedBox(height: 10),
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
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: const _AISupportFAB(),
    );
  }

  Widget _buildPersonalizedCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF818CF8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Exclusive Offers\nFor You!',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, height: 1.2),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Get up to 40% off on your favorite categories based on your history.',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6366F1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Claim Offer', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 80),
        ],
      ),
    );
  }
}

class _AISupportFAB extends StatelessWidget {
  const _AISupportFAB();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => Navigator.pushNamed(context, '/ai-chat'),
      backgroundColor: const Color(0xFF6366F1),
      elevation: 10,
      label: const Text('AI Support', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      icon: const Icon(Icons.auto_awesome_rounded, color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
