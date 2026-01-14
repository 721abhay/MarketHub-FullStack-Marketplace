import 'package:flutter/material.dart';

class MilkSubscriptionScreen extends StatefulWidget {
  static const String routeName = '/milk-subscription';
  const MilkSubscriptionScreen({super.key});

  @override
  State<MilkSubscriptionScreen> createState() => _MilkSubscriptionScreenState();
}

class _MilkSubscriptionScreenState extends State<MilkSubscriptionScreen> {
  // final bool _isDaily = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0FDF4),
      appBar: AppBar(
        title: const Text('Daily Subscriptions', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             _buildActiveSubs(),
             const SizedBox(height: 32),
             const Text('Available for Subscription', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
             const SizedBox(height: 16),
             _buildSubscriptionItem('Fresh Whole Milk', '1L Bottle', '\$1.50/day'),
             _buildSubscriptionItem('Farm Eggs (6 pcs)', 'Pack of 6', '\$3.00/day'),
             _buildSubscriptionItem('Wheat Bread', '400g Loaf', '\$1.20/day'),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveSubs() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF16A34A), Color(0xFF22C55E)]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Active Subscriptions', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Next Delivery', style: TextStyle(color: Colors.white70, fontSize: 12)), Text('Tomorrow, 7:00 AM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]),
              Icon(Icons.calendar_month, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionItem(String title, String subtitle, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)]),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.green[50], shape: BoxShape.circle),
            child: const Icon(Icons.auto_awesome, color: Color(0xFF16A34A)),
          ),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12))])),
          Column(
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF16A34A))),
              const SizedBox(height: 4),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF16A34A), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(horizontal: 12), minimumSize: const Size(0, 30)),
                child: const Text('Subscribe', style: TextStyle(fontSize: 11)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
