import 'package:markethub/features/hub/screens/main_hub_dashboard.dart';
import 'package:markethub/features/hub/screens/plus_subscription_screen.dart';
import 'package:markethub/features/hub/screens/qr_scanner_screen.dart';
import 'package:markethub/features/hub/screens/universal_ai_search_screen.dart';
import 'package:markethub/features/hub/screens/rewards_catalog_screen.dart';
import 'package:markethub/features/hub/screens/partner_program_screen.dart';
import 'package:flutter/material.dart';

class HubRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
       case MainHubDashboard.routeName:
        return MaterialPageRoute(builder: (_) => const MainHubDashboard());
      case UniversalAISearchScreen.routeName:
        return MaterialPageRoute(builder: (_) => const UniversalAISearchScreen());
      case QRScannerScreen.routeName:
        return MaterialPageRoute(builder: (_) => const QRScannerScreen());
      case MarketHubPlusScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MarketHubPlusScreen());
      case RewardsCatalogScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RewardsCatalogScreen());
      case PartnerProgramScreen.routeName:
        return MaterialPageRoute(builder: (_) => const PartnerProgramScreen());
      default:
        return null;
    }
  }
}
