import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatefulWidget {
  static const String routeName = '/order-tracking';
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text('Track Order', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Mock Map Background
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: const Color(0xFFE2E8F0),
                  child: Image.network('https://images.unsplash.com/photo-1526628953301-3e589a6a8b74?auto=format&fit=crop&q=80&w=1200', fit: BoxFit.cover),
                ),
                // Delivery Agent Marker
                const Positioned(
                  top: 200, left: 150,
                  child: Column(
                    children: [
                      CircleAvatar(backgroundColor: Color(0xFF10B981), child: Icon(Icons.delivery_dining_rounded, color: Colors.white)),
                      SizedBox(height: 4),
                      Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)), child: Text('Moving', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
                _buildStatusOverlay(),
              ],
            ),
          ),
          _buildDeliveryAgentInfo(),
        ],
      ),
    );
  }

  Widget _buildStatusOverlay() {
    return Positioned(
      top: 24, left: 24, right: 24,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
        child: const Column(
          children: [
             Row(
              children: [
                Icon(Icons.access_time_filled_rounded, color: Color(0xFF10B981)),
                SizedBox(width: 12),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Arriving in 12 mins', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text('Out for delivery', style: TextStyle(color: Colors.grey, fontSize: 13))]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryAgentInfo() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 28, backgroundImage: NetworkImage('https://images.unsplash.com/photo-1590086782957-93c06ef21604?auto=format&fit=crop&q=80&w=100')),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text('Your Delivery Partner', style: TextStyle(color: Colors.grey, fontSize: 13))]),
                ),
                Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.call, color: Color(0xFF10B981))),
              ],
            ),
            const SizedBox(height: 32),
            CustomButton(text: 'I\'ll be there', onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
