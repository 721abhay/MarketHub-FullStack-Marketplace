import 'package:markethub/common/widgets/shimmer_loader.dart';
import 'package:markethub/features/hub/services/hub_services.dart';
import 'package:markethub/features/jobs/screens/job_detail_screen.dart';
import 'package:markethub/models/service_models.dart';
import 'package:flutter/material.dart';

class JobBoardHomeScreen extends StatefulWidget {
  static const String routeName = '/jobs-home';
  const JobBoardHomeScreen({super.key});

  @override
  State<JobBoardHomeScreen> createState() => _JobBoardHomeScreenState();
}

class _JobBoardHomeScreenState extends State<JobBoardHomeScreen> {
  final HubServices hubServices = HubServices();
  List<JobListing>? jobs;

  @override
  void initState() {
    super.initState();
    _loadJobs();
  }

  void _loadJobs() async {
    final list = await hubServices.fetchJobListings(context: context);
    setState(() {
      jobs = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('MarketHub Careers', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF475569),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildSearchBanner(),
            const SizedBox(height: 32),
            _buildJobCategories(),
            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Recommended for You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            if (jobs == null)
              const Column(
                children: [
                  ShimmerLoader(width: double.infinity, height: 100),
                  SizedBox(height: 12),
                  ShimmerLoader(width: double.infinity, height: 100),
                ],
              )
            else
              ...jobs!.map((job) => _buildJobCard(job)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBanner() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF475569), Color(0xFF1E293B)]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Text('Find Your Dream Job', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Job title, keyword...',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobCategories() {
    final cats = [
      {'name': 'Technology', 'icon': Icons.code},
      {'name': 'Design', 'icon': Icons.palette},
      {'name': 'Marketing', 'icon': Icons.campaign},
      {'name': 'Sales', 'icon': Icons.payments},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: cats
          .map((c) => Expanded(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue[50],
                      radius: 26,
                      child: Icon(c['icon'] as IconData, color: const Color(0xFF475569)),
                    ),
                    const SizedBox(height: 8),
                    Text(c['name'] as String, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _buildJobCard(JobListing job) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, JobDetailScreen.routeName, arguments: {'title': job.title, 'company': job.company}),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.indigo[50], borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.business_rounded, color: Color(0xFF475569)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(job.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('${job.company} • ${job.location}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(job.salary, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: Colors.blueGrey[50], borderRadius: BorderRadius.circular(4)),
                        child: Text(job.type, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
