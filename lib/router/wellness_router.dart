import 'package:markethub/features/wellness/screens/fitness_challenge_screen.dart';
import 'package:markethub/features/wellness/screens/meditation_session_screen.dart';
import 'package:markethub/features/wellness/screens/mental_health_home_screen.dart';
import 'package:markethub/features/wellness/screens/nutrition_planner_screen.dart';
import 'package:markethub/features/wellness/screens/sleep_tracker_screen.dart';
import 'package:flutter/material.dart';

class WellnessRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MentalHealthHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MentalHealthHomeScreen());
      case SleepTrackerScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SleepTrackerScreen());
      case NutritionalPlannerScreen.routeName:
        return MaterialPageRoute(builder: (_) => const NutritionalPlannerScreen());
      case MeditationSessionScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MeditationSessionScreen());
      case FitnessChallengeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FitnessChallengeScreen());
      default:
        return null;
    }
  }
}
