import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/features/account/screens/coupons_screen.dart';
import 'package:markethub/features/appliances/screens/appliance_home_screen.dart';
import 'package:markethub/features/books/screens/book_home_screen.dart';
import 'package:markethub/features/fashion/screens/fashion_home_screen.dart';
import 'package:markethub/features/grocery/screens/grocery_home_screen.dart';
import 'package:markethub/features/grocery/screens/milk_subscription_screen.dart';
import 'package:markethub/features/home/screens/category_deals_screen.dart';
import 'package:markethub/features/home/screens/deals_screen.dart';
import 'package:markethub/features/hub/screens/main_hub_dashboard.dart';
import 'package:markethub/features/mobiles/screens/mobile_home_screen.dart';
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
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
        itemCount: GlobalVariables.categoryImages.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final category = GlobalVariables.categoryImages[index];
          return GestureDetector(
            onTap: () => navigateToCategoryPage(context, category['title']!),
            child: Container(
              width: 84,
              margin: const EdgeInsets.only(right: 14),
              child: Column(
                children: [
                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6366F1).withValues(alpha: 0.08),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(21),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              category['image']!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: const Color(0xFFF1F5F9),
                                child: const Icon(
                                  Icons.category_outlined,
                                  color: Color(0xFF6366F1),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withValues(alpha: 0.2),
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    category['title']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF334155),
                      letterSpacing: -0.2,
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
