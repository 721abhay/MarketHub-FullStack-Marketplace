import 'package:flutter/material.dart';

class HotelBookingScreen extends StatelessWidget {
  static const String routeName = '/hotel-booking';
  const HotelBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Hotels in New York'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(24)), child: Image.network('https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&q=80&w=600', height: 180, width: double.infinity, fit: BoxFit.cover)),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Grand Plaza Hotel', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), Row(children: [Icon(Icons.star, color: Colors.amber, size: 16), Text(' 4.8', style: TextStyle(fontWeight: FontWeight.bold))])]),
                      const Text('Midtown Manhattan, NY', style: TextStyle(color: Colors.grey, fontSize: 13)),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('\$199 / night', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF6366F1))),
                          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Book Now')),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
