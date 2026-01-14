import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class SellerAnalyticsScreen extends StatelessWidget {
  static const String routeName = '/seller-analytics';
  const SellerAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Advanced Analytics',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sales Overview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 16),
            Container(
              height: 250,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   _buildBar('Mon', 0.4),
                   _buildBar('Tue', 0.6),
                   _buildBar('Wed', 0.5),
                   _buildBar('Thu', 0.8),
                   _buildBar('Fri', 0.9),
                   _buildBar('Sat', 0.7),
                   _buildBar('Sun', 0.5),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Key Metrics',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.5,
              children: [
                _buildMetricCard('Conversion Rate', '3.2%', '+0.5%', Colors.green),
                _buildMetricCard('Avg Order Value', '\$45.20', '-1.2%', Colors.red),
                _buildMetricCard('Total Returns', '12', '-5%', Colors.green),
                _buildMetricCard('Store Visits', '1,204', '+12%', Colors.green),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Top Performing Regions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 16),
            _buildRegionRow('New York', '85%'),
            _buildRegionRow('California', '70%'),
            _buildRegionRow('Texas', '45%'),
            _buildRegionRow('Florida', '30%'),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(String day, double heightPct) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 20,
          height: 150 * heightPct,
          decoration: BoxDecoration(
            color: const Color(0xFF6366F1),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 8),
        Text(day, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildMetricCard(String title, String value, String change, Color changeColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
           BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          const SizedBox(height: 4),
          Container(
             padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
             decoration: BoxDecoration(
               color: changeColor.withValues(alpha: 0.1),
               borderRadius: BorderRadius.circular(4),
             ),
             child: Text(
               change,
               style: TextStyle(color: changeColor, fontSize: 10, fontWeight: FontWeight.bold),
             ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegionRow(String region, String pct) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(region, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(pct, style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
