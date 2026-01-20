import 'package:markethub/features/learning/screens/course_catalog_screen.dart';
import 'package:markethub/features/learning/screens/learning_home_screen.dart';
import 'package:markethub/features/learning/screens/lesson_player_screen.dart';
import 'package:markethub/features/learning/screens/my_certificates_screen.dart';
import 'package:markethub/features/learning/screens/quiz_assessment_screen.dart';
import 'package:flutter/material.dart';

class LearningRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LearningHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LearningHomeScreen());
      case CourseCatalogScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CourseCatalogScreen());
      case LessonPlayerScreen.routeName:
        var lessonData = settings.arguments as Map<String, dynamic>? ?? {};
        return MaterialPageRoute(builder: (_) => LessonPlayerScreen(lessonData: lessonData));
      case MyCertificatesScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MyCertificatesScreen());
      case QuizAssessmentScreen.routeName:
        return MaterialPageRoute(builder: (_) => const QuizAssessmentScreen());
      default:
        return null;
    }
  }
}
