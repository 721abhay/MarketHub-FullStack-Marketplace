import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/features/events/screens/ticket_selection_screen.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  static const String routeName = '/event-detail';
  final Map<String, dynamic> event;
  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                event['image'] ?? 'https://images.unsplash.com/photo-1540575467063-178a50c2df87?auto=format&fit=crop&q=80&w=800',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: const Color(0xFFFDF2F8), borderRadius: BorderRadius.circular(20)),
                    child: const Text('MUSIC CONCERT', style: TextStyle(color: Color(0xFFDB2777), fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 16),
                  Text(event['title'] ?? 'The Summer Beat Festival', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  _detailRow(Icons.calendar_today_rounded, '15 August 2026', '06:00 PM - 11:00 PM'),
                  const SizedBox(height: 16),
                  _detailRow(Icons.location_on_rounded, 'Grand Stadium Area', 'Sector 4, New City'),
                  const SizedBox(height: 32),
                  const Text('About Event', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  const Text(
                    'Get ready for the biggest music festival of the year! Join us for a night of incredible performances, food, and fun. Featuring top artists from around the globe.',
                    style: TextStyle(height: 1.6, color: Color(0xFF475569)),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10)],
        ),
        child: Row(
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tickets from', style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text('\$49.00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: CustomButton(
                text: 'Book Now',
                onTap: () {
                   Navigator.pushNamed(context, TicketSelectionScreen.routeName, arguments: event);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(14)),
          child: Icon(icon, color: const Color(0xFFDB2777), size: 24),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          ],
        ),
      ],
    );
  }
}
