import 'package:amazon_clone/features/jobs/screens/job_detail_screen.dart';
import 'package:flutter/material.dart';

class JobBoardHomeScreen extends StatelessWidget {
  static const String routeName = '/jobs-home';
  const JobBoardHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('MarketHub Careers'), backgroundColor: const Color(0xFF475569), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildSearchBanner(),
            const SizedBox(height: 32),
            _buildJobCategories(),
            const SizedBox(height: 32),
            const Align(alignment: Alignment.centerLeft, child: Text('Recommended for You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 16),
             _buildJobCard(context, 'Senior Flutter Engineer', 'TechCorp • Remote', '\$140k - \$180k'),
             _buildJobCard(context, 'Product Designer', 'DesignStudio • NY', '\$110k - \$150k'),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBanner() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFF475569), Color(0xFF1E293B)]), borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          const Text('Find Your Dream Job', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: const TextField(decoration: InputDecoration(hintText: 'Job title, keyword...', prefixIcon: Icon(Icons.search), border: InputBorder.none))),
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
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: cats.map((c) => Expanded(child: Column(children: [CircleAvatar(backgroundColor: Colors.blue[50], child: Icon(c['icon'] as IconData, color: const Color(0xFF475569))), const SizedBox(height: 8), Text(c['name'] as String, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold))]))).toList());
  }

  Widget _buildJobCard(BuildContext context, String title, String company, String salary) {
     return GestureDetector(
       onTap: () => Navigator.pushNamed(context, JobDetailScreen.routeName, arguments: {'title': title, 'company': company}),
       child: Container(
         margin: const EdgeInsets.only(bottom: 12),
         padding: const EdgeInsets.all(20),
         decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey[200]!)),
         child: Row(
           children: [
             Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.business, color: Color(0xFF475569))),
             const SizedBox(width: 16),
             Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), Text(company, style: const TextStyle(color: Colors.grey, fontSize: 12)), const SizedBox(height: 4), Text(salary, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 11))])),
             const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
           ],
         ),
       ),
     );
  }
}
