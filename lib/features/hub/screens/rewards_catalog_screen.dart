import 'package:flutter/material.dart';

class RewardsCatalogScreen extends StatelessWidget {
  static const String routeName = '/rewards';
  const RewardsCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('MarketHub Rewards'), backgroundColor: const Color(0xFFFFD700).withValues(alpha: 0.9), foregroundColor: Colors.black),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildPointsBanner(),
            const SizedBox(height: 32),
            _buildRewardItem('50% Off Travel', '10,000 Points'),
            _buildRewardItem('Free Prime Access', '5,000 Points'),
            _buildRewardItem('Grocery Coupon', '1,000 Points'),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFFFACC15), Color(0xFFEAB308)]), borderRadius: BorderRadius.circular(32)),
      child: const Column(
        children: [
          Text('Your Total Points', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
          Text('12,450', style: TextStyle(color: Colors.black, fontSize: 48, fontWeight: FontWeight.bold)),
          Text('Gold Member Status', style: TextStyle(color: Colors.black45, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRewardItem(String title, String points) {
    return Container(
       margin: const EdgeInsets.only(bottom: 16),
       padding: const EdgeInsets.all(24),
       decoration: BoxDecoration(color: const Color(0xFFFFFBEB), borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFFEF3C7))),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), Text(points, style: const TextStyle(color: Color(0xFFB45309), fontSize: 12, fontWeight: FontWeight.bold))]),
           const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFFB45309)),
         ],
       ),
    );
  }
}
