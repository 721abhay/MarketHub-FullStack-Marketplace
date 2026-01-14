import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone/features/home/screens/deals_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/features/search/screens/search_screen.dart';
import 'package:amazon_clone/features/search/screens/visual_search_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class CommerceRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case SearchScreen.routeName:
        var searchQuery = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => SearchScreen(searchQuery: searchQuery));
      case VisualSearchScreen.routeName:
        return MaterialPageRoute(builder: (_) => const VisualSearchScreen());
      case ProductDetailScreen.routeName:
        var product = settings.arguments as Product;
        return MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product));
      case CategoryDealsScreen.routeName:
        var category = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => CategoryDealsScreen(category: category));
      case DealsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DealsScreen());
      default:
        return null;
    }
  }
}
