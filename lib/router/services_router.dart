import 'package:markethub/features/services/screens/expert_consultation_screen.dart';
import 'package:markethub/features/services/screens/home_services_screen.dart';
import 'package:markethub/features/services/screens/service_booking_screen.dart';
import 'package:flutter/material.dart';

class ServicesRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ServiceProfessionalScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ServiceProfessionalScreen());
      case ServiceBookingScreen.routeName:
        var professionalName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ServiceBookingScreen(professionalName: professionalName),
        );
      case ExpertConsultationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ExpertConsultationScreen());
      default:
        return null;
    }
  }
}
