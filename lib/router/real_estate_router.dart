import 'package:markethub/features/real_estate/screens/property_detail_screen.dart';
import 'package:markethub/features/real_estate/screens/property_home_screen.dart';
import 'package:markethub/features/real_estate/screens/schedule_tour_screen.dart';
import 'package:flutter/material.dart';

class RealEstateRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RealEstateHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RealEstateHomeScreen());
      case PropertyDetailScreen.routeName:
        var property = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => PropertyDetailScreen(property: property));
      case ScheduleTourScreen.routeName:
        var property = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => ScheduleTourScreen(property: property));
      default:
        return null;
    }
  }
}
