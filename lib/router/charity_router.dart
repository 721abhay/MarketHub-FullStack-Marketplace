import 'package:markethub/features/charity/screens/charity_donation_screen.dart';
import 'package:flutter/material.dart';

class CharityRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharityDonationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CharityDonationScreen());
      default:
        return null;
    }
  }
}
