import 'package:flutter/material.dart';

class LessonPlayerScreen extends StatelessWidget {
  static const String routeName = '/lesson-player';
  final Map<String, dynamic> lessonData;
  const LessonPlayerScreen({super.key, required this.lessonData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: 250, 
            color: Colors.grey[900], 
            child: const Center(
              child: Icon(Icons.play_circle_fill, color: Colors.white, size: 60)
            )
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.vertical(top: Radius.circular(32))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lessonData['chapter'] ?? 'Chapter 4: Data Preprocessing', 
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                  ),
                  const SizedBox(height: 8),
                  Text(
                    lessonData['desc'] ?? 'Introduction to Cleaning and Normalizing Datasets.', 
                    style: const TextStyle(color: Colors.grey)
                  ),
                  const SizedBox(height: 32),
                  const Text('Course Progress', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                         return ListTile(
                           contentPadding: EdgeInsets.zero,
                           leading: Icon(
                             index == 0 ? Icons.play_circle : Icons.lock, 
                             color: index == 0 ? Colors.indigo : Colors.grey
                           ),
                           title: Text(
                             'Lesson ${index + 1}: Basics', 
                             style: TextStyle(
                               color: index == 0 ? Colors.indigo : Colors.black87, 
                               fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal
                             )
                           ),
                           trailing: const Text('12:00', style: TextStyle(color: Colors.grey, fontSize: 12)),
                         );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
