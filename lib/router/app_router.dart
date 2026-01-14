import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/router/account_router.dart';
import 'package:amazon_clone/router/commerce_router.dart';
import 'package:amazon_clone/router/finance_router.dart';
import 'package:amazon_clone/router/grocery_router.dart';
import 'package:amazon_clone/router/health_router.dart';
import 'package:amazon_clone/router/hub_router.dart';
import 'package:amazon_clone/router/jobs_router.dart';
import 'package:amazon_clone/router/real_estate_router.dart';
import 'package:amazon_clone/router/travel_router.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // Check in sub-routers
    final commerceRoute = CommerceRouter.generateRoute(settings);
    if (commerceRoute != null) return commerceRoute;

    final hubRoute = HubRouter.generateRoute(settings);
    if (hubRoute != null) return hubRoute;

    final groceryRoute = GroceryRouter.generateRoute(settings);
    if (groceryRoute != null) return groceryRoute;

    final travelRoute = TravelRouter.generateRoute(settings);
    if (travelRoute != null) return travelRoute;

    final financeRoute = FinanceRouter.generateRoute(settings);
    if (financeRoute != null) return financeRoute;

    final accountRoute = AccountRouter.generateRoute(settings);
    if (accountRoute != null) return accountRoute;

    final jobsRoute = JobsRouter.generateRoute(settings);
    if (jobsRoute != null) return jobsRoute;

    final realEstateRoute = RealEstateRouter.generateRoute(settings);
    if (realEstateRoute != null) return realEstateRoute;

    final healthRoute = HealthRouter.generateRoute(settings);
    if (healthRoute != null) return healthRoute;

    // Direct cases for root screens
    switch (settings.name) {
      case AuthScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case BottomBar.routeName:
        return MaterialPageRoute(builder: (_) => const BottomBar());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Screen not found!')),
          ),
        );
    }
  }
}
