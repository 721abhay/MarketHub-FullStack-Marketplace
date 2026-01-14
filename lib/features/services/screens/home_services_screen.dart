import 'package:amazon_clone/features/services/screens/service_booking_screen.dart';
import 'package:flutter/material.dart';

class ServiceProfessionalScreen extends StatelessWidget {
  static const String routeName = '/home-services';
  const ServiceProfessionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('Home Services'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Professional Help for Your Home', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Verified professionals for every task.', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 32),
            _buildServiceCategories(),
            const SizedBox(height: 32),
            const Text('Highly Rated Near You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildProfessionalCard(context, 'Alex Plumbing', '4.9 • 240 Reviews', 'Starts at \$25/hr'),
            _buildProfessionalCard(context, 'Sparky Electrician', '4.8 • 156 Reviews', 'Starts at \$30/hr'),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCategories() {
    final services = [
       {'name': 'Plumbing', 'icon': Icons.plumbing},
       {'name': 'Electrical', 'icon': Icons.electrical_services},
       {'name': 'Cleaning', 'icon': Icons.cleaning_services},
       {'name': 'AC Repair', 'icon': Icons.ac_unit},
    ];
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: services.map((s) => Expanded(child: Column(children: [CircleAvatar(backgroundColor: Colors.blue[50], radius: 28, child: Icon(s['icon'] as IconData, color: const Color(0xFF6366F1))), const SizedBox(height: 8), Text(s['name'] as String, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold))]))).toList());
  }

  Widget _buildProfessionalCard(BuildContext context, String name, String rating, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)]),
      child: Row(
        children: [
          const CircleAvatar(radius: 30, backgroundImage: NetworkImage('https://images.unsplash.com/photo-1540569014015-19a7be504e3a?auto=format&fit=crop&q=80&w=200')),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text(rating, style: const TextStyle(color: Colors.grey, fontSize: 12)), const SizedBox(height: 4), Text(price, style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 13))])),
           ElevatedButton(onPressed: () => Navigator.pushNamed(context, ServiceBookingScreen.routeName, arguments: name), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Book')),
        ],
      ),
    );
  }
}
