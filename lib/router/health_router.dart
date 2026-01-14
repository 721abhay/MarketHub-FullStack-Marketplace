import 'package:markethub/features/health/screens/consultation_chat_screen.dart';
import 'package:markethub/features/health/screens/doctor_consultation_screen.dart';
import 'package:markethub/features/health/screens/medication_reminder_screen.dart';
import 'package:markethub/features/health/screens/pharmacy_home_screen.dart';
import 'package:markethub/features/health/screens/prescription_upload_screen.dart';
import 'package:flutter/material.dart';

class HealthRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PharmacyHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const PharmacyHomeScreen());
      case PrescriptionUploadScreen.routeName:
        return MaterialPageRoute(builder: (_) => const PrescriptionUploadScreen());
      case DoctorConsultationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DoctorConsultationScreen());
      case ConsultationChatScreen.routeName:
        var doctorName = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => ConsultationChatScreen(doctorName: doctorName));
      case MedicationReminderScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MedicationReminderScreen());
      default:
        return null;
    }
  }
}
