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

  // Mock products for the showcase
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

  final List<Product> fashionDeals = [
    Product(
      name: 'Men\'s Running Shoes',
      description: 'Comfortable and durable',
      quantity: 20,
      images: ['https://images.unsplash.com/photo-1542291026-7eec264c274f?q=80&w=400&auto=format&fit=crop'],
      category: 'Fashion',
      price: 59,
      id: 'f1',
      rating: [],
    ),
    Product(
      name: 'Casual Cotton Tee',
      description: 'Perfect for summer',
      quantity: 50,
      images: ['https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?q=80&w=400&auto=format&fit=crop'],
      category: 'Fashion',
      price: 19,
      id: 'f2',
      rating: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

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
                      prefixIcon: Icon(Icons.search_rounded, color: Color(0xFF6366F1)),
                      hintText: 'Search products...',
                      hintStyle: TextStyle(fontSize: 15, color: Color(0xFF94A3B8)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.2),
                child: const Icon(Icons.notifications_none_rounded, color: Colors.white),
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
                    'Hello, ${user.name}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const Text(
                    'Find Your Best Deal',
                    style: TextStyle(
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
            const DealOfDay(),
            ProductShowcase(
              title: 'Recommended for you',
              products: phoneDeals,
            ),
            ProductShowcase(
              title: 'Trending in Fashion',
              products: fashionDeals,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
