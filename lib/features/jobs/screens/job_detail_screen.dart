import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/features/jobs/screens/apply_job_screen.dart';
import 'package:flutter/material.dart';

class JobDetailScreen extends StatelessWidget {
  static const String routeName = '/job-detail';
  final Map<String, dynamic> job;
  const JobDetailScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Job Details', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(16)),
                        child: const Icon(Icons.business_rounded, color: Color(0xFF0D9488), size: 40),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(job['title'] ?? 'Software Engineer', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            Text(job['company'] ?? 'TechCorp Solutions', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _infoChip(Icons.location_on_outlined, job['location'] ?? 'San Francisco, CA'),
                      _infoChip(Icons.timer_outlined, 'Full-time'),
                      _infoChip(Icons.payments_outlined, '\$120k - \$160k'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text('Job Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  const Text(
                    'We are looking for a passionate engineer to join our core team. You will be responsible for building scalable services and beautiful user interfaces that impact millions of users.',
                    style: TextStyle(height: 1.6, color: Color(0xFF475569)),
                  ),
                  const SizedBox(height: 32),
                  const Text('Requirements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _requirementItem('3+ years of experience with Flutter or Native development.'),
                  _requirementItem('Strong understanding of state management and clean architecture.'),
                  _requirementItem('Excellent problem-solving and communication skills.'),
                  _requirementItem('Ability to work in a fast-paced startup environment.'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: CustomButton(
              text: 'Apply Now',
              onTap: () {
                Navigator.pushNamed(context, ApplyJobScreen.routeName, arguments: job);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoChip(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF0D9488), size: 20),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _requirementItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(text, style: const TextStyle(color: Color(0xFF475569)))),
        ],
      ),
    );
  }
}
