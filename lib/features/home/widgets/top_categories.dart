import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/coupons_screen.dart';
import 'package:amazon_clone/features/appliances/screens/appliance_home_screen.dart';
import 'package:amazon_clone/features/books/screens/book_home_screen.dart';
import 'package:amazon_clone/features/fashion/screens/fashion_home_screen.dart';
import 'package:amazon_clone/features/gamification/screens/daily_check_in_screen.dart';
import 'package:amazon_clone/features/grocery/screens/grocery_home_screen.dart';
import 'package:amazon_clone/features/grocery/screens/milk_subscription_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone/features/home/screens/deals_screen.dart';
import 'package:amazon_clone/features/hub/screens/main_hub_dashboard.dart';
import 'package:amazon_clone/features/mobiles/screens/mobile_home_screen.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  void navigateToCategoryPage(BuildContext context, String category) {
    switch (category) {
      case 'Grocery':
        Navigator.pushNamed(context, GroceryHomeScreen.routeName);
        break;
      case 'Milk Sub':
        Navigator.pushNamed(context, MilkSubscriptionScreen.routeName);
        break;
      case 'Coupons':
        Navigator.pushNamed(context, CouponsScreen.routeName);
        break;
      case 'Mobiles':
        Navigator.pushNamed(context, MobileHomeScreen.routeName);
        break;
      case 'Fashion':
        Navigator.pushNamed(context, FashionHomeScreen.routeName);
        break;
      case 'Appliances':
        Navigator.pushNamed(context, ApplianceHomeScreen.routeName);
        break;
      case 'Books':
        Navigator.pushNamed(context, BookHomeScreen.routeName);
        break;
      case 'Market Hub':
        Navigator.pushNamed(context, MainHubDashboard.routeName);
        break;
      case 'Deals':
        Navigator.pushNamed(context, DealsScreen.routeName);
        break;
      default:
        Navigator.pushNamed(context, CategoryDealsScreen.routeName, arguments: category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: GlobalVariables.categoryImages.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final category = GlobalVariables.categoryImages[index];
          return GestureDetector(
            onTap: () => navigateToCategoryPage(context, category['title']!),
            child: Container(
              width: 80,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  Container(
                    height: 64,
                    width: 64,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFF1F5F9)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Image.network(
                      category['image']!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.category_outlined,
                        color: Color(0xFF6366F1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category['title']!,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF64748B),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
