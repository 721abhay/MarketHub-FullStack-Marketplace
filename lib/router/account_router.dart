import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/account/screens/notifications_screen.dart';
import 'package:amazon_clone/features/account/screens/privacy_dashboard_screen.dart';
import 'package:amazon_clone/features/account/screens/verification_center_screen.dart';
import 'package:amazon_clone/features/account/screens/impact_tracker_screen.dart';
import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';
import 'package:amazon_clone/features/account/screens/your_orders_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:flutter/material.dart';

class AccountRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AccountScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AccountScreen());
      case NotificationsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case PrivacyDashboardScreen.routeName:
        return MaterialPageRoute(builder: (_) => const PrivacyDashboardScreen());
      case VerificationCenterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const VerificationCenterScreen());
      case ImpactTrackerScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ImpactTrackerScreen());
      case YourOrdersScreen.routeName:
        return MaterialPageRoute(builder: (_) => const YourOrdersScreen());
      case OrderDetailScreen.routeName:
        var order = settings.arguments as Order;
        return MaterialPageRoute(builder: (_) => OrderDetailScreen(order: order));
      default:
        return null;
    }
  }
}
