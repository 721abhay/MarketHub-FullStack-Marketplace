import 'package:markethub/features/corporate/screens/sustainability_report_screen.dart';
import 'package:flutter/material.dart';

class CorporateRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SustainabilityReportScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SustainabilityReportScreen());
      default:
        return null;
    }
  }
}
