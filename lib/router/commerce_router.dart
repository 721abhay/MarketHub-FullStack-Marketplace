import 'package:markethub/features/appliances/screens/appliance_home_screen.dart';
import 'package:markethub/features/books/screens/book_home_screen.dart';
import 'package:markethub/features/fashion/screens/fashion_home_screen.dart';
import 'package:markethub/features/home/screens/buying_guide_screen.dart';
import 'package:markethub/features/home/screens/category_deals_screen.dart';
import 'package:markethub/features/home/screens/deals_screen.dart';
import 'package:markethub/features/home/screens/home_screen.dart';
import 'package:markethub/features/mobiles/screens/mobile_home_screen.dart';
import 'package:markethub/features/product_details/screens/product_details_screen.dart';
import 'package:markethub/features/search/screens/search_screen.dart';
import 'package:markethub/features/search/screens/visual_search_screen.dart';
import 'package:markethub/features/shopping_list/screens/shopping_list_screen.dart';
import 'package:markethub/models/product.dart';
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
      case MobileHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MobileHomeScreen());
      case FashionHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FashionHomeScreen());
      case ApplianceHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ApplianceHomeScreen());
      case BookHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const BookHomeScreen());
      case ShoppingListScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ShoppingListScreen());
      case BuyingGuideScreen.routeName:
        var category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BuyingGuideScreen(category: category),
        );
      default:
        return null;
    }
  }
}
