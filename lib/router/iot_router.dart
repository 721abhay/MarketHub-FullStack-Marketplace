import 'package:markethub/features/iot/screens/automation_routine_screen.dart';
import 'package:markethub/features/iot/screens/device_pairing_screen.dart';
import 'package:markethub/features/iot/screens/energy_usage_report.dart';
import 'package:markethub/features/iot/screens/security_camera_feed.dart';
import 'package:markethub/features/iot/screens/smart_home_dashboard.dart';
import 'package:markethub/features/iot/screens/smart_lock_screen.dart';
import 'package:flutter/material.dart';

class IotRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SmartHomeDashboard.routeName:
        return MaterialPageRoute(builder: (_) => const SmartHomeDashboard());
      case DevicePairingScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DevicePairingScreen());
      case SecurityCameraFeed.routeName:
         var cameraName = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => SecurityCameraFeed(cameraName: cameraName));
      case SmartDoorLockControl.routeName:
        return MaterialPageRoute(builder: (_) => const SmartDoorLockControl());
      case EnergyUsageReport.routeName:
        return MaterialPageRoute(builder: (_) => const EnergyUsageReport());
      case AutomationRoutineScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AutomationRoutineScreen());
      default:
        return null;
    }
  }
}
