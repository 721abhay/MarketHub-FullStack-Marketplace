import 'package:amazon_clone/features/jobs/screens/apply_job_screen.dart';
import 'package:amazon_clone/features/jobs/screens/job_detail_screen.dart';
import 'package:amazon_clone/features/jobs/screens/jobs_home_screen.dart';
import 'package:flutter/material.dart';

class JobsRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case JobBoardHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const JobBoardHomeScreen());
      case JobDetailScreen.routeName:
        var job = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => JobDetailScreen(job: job));
      case ApplyJobScreen.routeName:
        var job = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => ApplyJobScreen(job: job));
      default:
        return null;
    }
  }
}
