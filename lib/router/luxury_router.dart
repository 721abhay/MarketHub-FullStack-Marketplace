import 'package:markethub/features/luxury/screens/designer_lookbook_screen.dart';
import 'package:markethub/features/luxury/screens/luxury_home_screen.dart';
import 'package:markethub/features/luxury/screens/virtual_storefront_screen.dart';
import 'package:flutter/material.dart';

class LuxuryRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LuxuryBoutiqueHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LuxuryBoutiqueHomeScreen());
      case DesignerLookbookScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DesignerLookbookScreen());
      case VirtualStorefrontScreen.routeName:
        return MaterialPageRoute(builder: (_) => const VirtualStorefrontScreen());
      default:
        return null;
    }
  }
}
