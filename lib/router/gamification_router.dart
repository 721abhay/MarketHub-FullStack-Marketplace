import 'package:markethub/features/gamification/screens/daily_check_in_screen.dart';
import 'package:markethub/features/gamification/screens/leaderboard_screen.dart';
import 'package:markethub/features/gamification/screens/quiz_screen.dart';
import 'package:markethub/features/gamification/screens/spin_wheel_screen.dart';
import 'package:flutter/material.dart';

class GamificationRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DailyCheckInScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DailyCheckInScreen());
      case LeaderboardScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LeaderboardScreen());
      case QuizScreen.routeName:
        return MaterialPageRoute(builder: (_) => const QuizScreen());
      case SpinWheelScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SpinWheelScreen());
      default:
        return null;
    }
  }
}
