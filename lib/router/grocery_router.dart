import 'package:amazon_clone/features/grocery/screens/fresh_order_details_screen.dart';
import 'package:amazon_clone/features/grocery/screens/grocery_category_screen.dart';
import 'package:amazon_clone/features/grocery/screens/grocery_home_screen.dart';
import 'package:amazon_clone/features/grocery/screens/milk_subscription_screen.dart';
import 'package:amazon_clone/features/grocery/screens/order_tracking_screen.dart';
import 'package:amazon_clone/features/grocery/screens/recipe_catalog_screen.dart';
import 'package:amazon_clone/features/grocery/screens/slot_booking_screen.dart';
import 'package:flutter/material.dart';

class GroceryRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case GroceryHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const GroceryHomeScreen());
      case GroceryCategoryScreen.routeName:
        var category = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => GroceryCategoryScreen(category: category));
      case SlotBookingScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SlotBookingScreen());
      case OrderTrackingScreen.routeName:
        return MaterialPageRoute(builder: (_) => const OrderTrackingScreen());
      case FreshOrderDetailsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FreshOrderDetailsScreen());
      case MilkSubscriptionScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MilkSubscriptionScreen());
      case RecipeCatalogScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RecipeCatalogScreen());
      default:
        return null;
    }
  }
}
