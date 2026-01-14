import 'package:markethub/features/account/screens/account_screen.dart';
import 'package:markethub/features/account/screens/notifications_screen.dart';
import 'package:markethub/features/account/screens/privacy_dashboard_screen.dart';
import 'package:markethub/features/account/screens/verification_center_screen.dart';
import 'package:markethub/features/account/screens/impact_tracker_screen.dart';
import 'package:markethub/features/account/screens/edit_profile_screen.dart';
import 'package:markethub/features/account/screens/help_center_screen.dart';
import 'package:markethub/features/account/screens/feedback_screen.dart';
import 'package:markethub/features/account/screens/wishlist_screen.dart';
import 'package:markethub/features/account/screens/wallet_screen.dart';
import 'package:markethub/features/account/screens/loyalty_points_screen.dart';
import 'package:markethub/features/account/screens/referral_screen.dart';
import 'package:markethub/features/corporate/screens/sustainability_report_screen.dart';
import 'package:markethub/features/content/screens/about_us_screen.dart';
import 'package:markethub/features/content/screens/blog_screen.dart';
import 'package:markethub/features/content/screens/legal/privacy_policy_screen.dart';
import 'package:markethub/features/content/screens/legal/terms_conditions_screen.dart';
import 'package:markethub/features/order_details/screens/order_details_screen.dart';
import 'package:markethub/features/account/screens/your_orders_screen.dart';
import 'package:markethub/models/order.dart';
import 'package:flutter/material.dart';

class AccountRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AccountScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AccountScreen());
      case NotificationsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case DataPrivacyDashboard.routeName:
        return MaterialPageRoute(builder: (_) => const DataPrivacyDashboard());
      case VerificationCenterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const VerificationCenterScreen());
      case EnvironmentalImpactTracker.routeName:
        return MaterialPageRoute(builder: (_) => const EnvironmentalImpactTracker());
      case YourOrdersScreen.routeName:
        return MaterialPageRoute(builder: (_) => const YourOrdersScreen());
      case OrderDetailScreen.routeName:
        var order = settings.arguments as Order;
        return MaterialPageRoute(builder: (_) => OrderDetailScreen(order: order));
      case EditProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case HelpCenterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HelpCenterScreen());
      case FeedbackScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FeedbackScreen());
      case WishlistScreen.routeName:
        return MaterialPageRoute(builder: (_) => const WishlistScreen());
      case WalletScreen.routeName:
        return MaterialPageRoute(builder: (_) => const WalletScreen());
      case LoyaltyPointsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoyaltyPointsScreen());
      case ReferralScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ReferralScreen());
      case SustainabilityReportScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SustainabilityReportScreen());
      case AboutUsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AboutUsScreen());
      case BlogScreen.routeName:
        return MaterialPageRoute(builder: (_) => const BlogScreen());
      case PrivacyPolicyScreen.routeName:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
      case TermsConditionsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TermsConditionsScreen());
      default:
        return null;
    }
  }
}
