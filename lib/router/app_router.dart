import 'package:markethub/common/widgets/bottom_bar.dart';
import 'package:markethub/features/auth/screens/auth_screen.dart';
import 'package:markethub/features/auth/screens/forgot_password_screen.dart';
import 'package:markethub/features/auth/screens/otp_verification_screen.dart';
import 'package:markethub/features/auth/screens/splash_screen.dart';
import 'package:markethub/router/account_router.dart';
import 'package:markethub/router/commerce_router.dart';
import 'package:markethub/router/events_router.dart';
import 'package:markethub/router/finance_router.dart';
import 'package:markethub/router/grocery_router.dart';
import 'package:markethub/router/health_router.dart';
import 'package:markethub/router/hub_router.dart';
import 'package:markethub/router/jobs_router.dart';
import 'package:markethub/router/real_estate_router.dart';
import 'package:markethub/router/services_router.dart';
import 'package:markethub/router/social_router.dart';
import 'package:markethub/router/travel_router.dart';
import 'package:markethub/router/wellness_router.dart';
import 'package:markethub/router/iot_router.dart';
import 'package:markethub/router/learning_router.dart';
import 'package:markethub/router/gamification_router.dart';
import 'package:markethub/router/luxury_router.dart';
import 'package:markethub/router/corporate_router.dart';
import 'package:markethub/router/charity_router.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // Check in modular sub-routers
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

    final servicesRoute = ServicesRouter.generateRoute(settings);
    if (servicesRoute != null) return servicesRoute;

    final eventsRoute = EventsRouter.generateRoute(settings);
    if (eventsRoute != null) return eventsRoute;

    final socialRoute = SocialRouter.generateRoute(settings);
    if (socialRoute != null) return socialRoute;

    final wellnessRoute = WellnessRouter.generateRoute(settings);
    if (wellnessRoute != null) return wellnessRoute;

    final iotRoute = IotRouter.generateRoute(settings);
    if (iotRoute != null) return iotRoute;

    final learningRoute = LearningRouter.generateRoute(settings);
    if (learningRoute != null) return learningRoute;

    final gamificationRoute = GamificationRouter.generateRoute(settings);
    if (gamificationRoute != null) return gamificationRoute;

    final luxuryRoute = LuxuryRouter.generateRoute(settings);
    if (luxuryRoute != null) return luxuryRoute;

    final corporateRoute = CorporateRouter.generateRoute(settings);
    if (corporateRoute != null) return corporateRoute;

    final charityRoute = CharityRouter.generateRoute(settings);
    if (charityRoute != null) return charityRoute;

    // Direct root cases
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AuthScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case OTPVerificationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const OTPVerificationScreen());
      case BottomBar.routeName:
        return MaterialPageRoute(builder: (_) => const BottomBar());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Navigation Error')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Route not found: ${settings.name}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('Please verify the router configuration.'),
                ],
              ),
            ),
          ),
        );
    }
  }
}
