import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  static const String routeName = '/event-details';
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(expandedHeight: 250, pinned: true, backgroundColor: const Color(0xFFF43F5E), flexibleSpace: FlexibleSpaceBar(background: Image.network('https://images.unsplash.com/photo-1459749411177-042180ce673b?auto=format&fit=crop&q=80&w=800', fit: BoxFit.cover))),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text('Cyber City Music Fest 2026', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                   const SizedBox(height: 8),
                   const Row(children: [Icon(Icons.star, color: Colors.amber, size: 20), Text(' 4.8 (2.4k Reviews)', style: TextStyle(fontWeight: FontWeight.bold))]),
                   const Divider(height: 48),
                   const Text('About the Event', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                   const SizedBox(height: 12),
                   Text('Join us for the biggest music festival of the year! Featuring top international artists and an immersive laser show.', style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.5)),
                   const SizedBox(height: 40),
                   _buildInfoRow(Icons.calendar_today, 'Date & Time', '15 Jan 2026, 06:00 PM'),
                   const SizedBox(height: 20),
                   _buildInfoRow(Icons.location_on, 'Venue', 'City Stadium Grand Arena'),
                   const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price Starts from', style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text('\$45.00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF43F5E),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              ),
              child: const Text('Select Seats'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String val) {
    return Row(children: [Icon(icon, color: const Color(0xFFF43F5E)), const SizedBox(width: 16), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)), Text(val, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))])]);
  }
}
