import 'package:flutter/material.dart';
import 'package:markethub/features/learning/services/learning_services.dart';
import 'package:markethub/models/service_models.dart';
import 'package:markethub/common/widgets/loader.dart';

class LearningHomeScreen extends StatefulWidget {
  static const String routeName = '/learning-home';
  const LearningHomeScreen({super.key});

  @override
  State<LearningHomeScreen> createState() => _LearningHomeScreenState();
}

class _LearningHomeScreenState extends State<LearningHomeScreen> {
  final LearningServices learningServices = LearningServices();
  List<Course>? courses;

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  void fetchCourses() async {
    courses = await learningServices.fetchCourses(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
          title: const Text('MarketHub Learning'),
          backgroundColor: const Color(0xFF6366F1),
          foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildContinueLearning(),
            const SizedBox(height: 32),
            courses == null
                ? const Loader()
                : _buildCourseGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueLearning() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Continue where you left off',
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 8),
          const Text('Advanced Mobile Development',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          LinearProgressIndicator(
              value: 0.65,
              backgroundColor: Colors.grey[200],
              color: const Color(0xFF6366F1),
              minHeight: 8,
              borderRadius: BorderRadius.circular(4)),
          const SizedBox(height: 8),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('65% Completed',
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text('12/18 Lessons',
                    style: TextStyle(color: Colors.grey, fontSize: 12))
              ]),
        ],
      ),
    );
  }

  Widget _buildCourseGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8),
      itemCount: courses!.length,
      itemBuilder: (context, index) {
        final course = courses![index];
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Expanded(
                  child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.network(course.thumbnailUrl,
                          fit: BoxFit.cover))),
              Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(course.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(height: 4),
                      Text(course.instructor,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 11)),
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }
}

