import 'package:flutter/material.dart';

class FreshOrderDetailsScreen extends StatelessWidget {
  static const String routeName = '/fresh-order-details';
  const FreshOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Fresh Order Detail', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusCard(),
            const SizedBox(height: 24),
            _buildDeliveryInfo(),
            const SizedBox(height: 24),
            _buildItemList(),
            const SizedBox(height: 24),
            _buildOrderSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFF16A34A).withValues(alpha: 0.2))),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF16A34A), size: 40),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Out for Delivery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Arriving by 11:00 AM Today', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Delivery Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: const Column(
            children: [
              Row(children: [Icon(Icons.location_on, color: Colors.grey), SizedBox(width: 12), Text('Home: 123 Fresh Lane, Green City')]),
              SizedBox(height: 16),
              Row(children: [Icon(Icons.timer, color: Colors.grey), SizedBox(width: 12), Text('Slot: 09:00 AM - 11:00 AM')]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItemList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Items', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: const Row(
                children: [
                  CircleAvatar(backgroundImage: NetworkImage('https://images.unsplash.com/photo-1518843875459-f738682238a6?auto=format&fit=crop&q=80&w=200'), radius: 25),
                  SizedBox(width: 16),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Organic Tomatoes', style: TextStyle(fontWeight: FontWeight.bold)), Text('500g x 1', style: TextStyle(color: Colors.grey, fontSize: 12))])),
                  Text('\$2.49', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: const Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Subtotal'), Text('\$12.45')]),
          SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Delivery Fee'), Text('FREE', style: TextStyle(color: Color(0xFF16A34A)))]),
          Divider(height: 24),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Order Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text('\$12.45', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))]),
        ],
      ),
    );
  }
}
