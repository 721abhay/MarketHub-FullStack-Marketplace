import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/features/real_estate/screens/schedule_tour_screen.dart';
import 'package:flutter/material.dart';

class PropertyDetailScreen extends StatelessWidget {
  static const String routeName = '/property-detail';
  final Map<String, dynamic> property;
  const PropertyDetailScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                property['image'] ?? 'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?auto=format&fit=crop&q=80&w=800',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(property['title'] ?? 'Modern Villa', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const Text('\$1.2M', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF6366F1))),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Icon(Icons.location_on_rounded, color: Colors.grey, size: 16),
                      SizedBox(width: 4),
                      Text('Beverly Hills, Los Angeles', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text('Features', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _featureItem(Icons.bed_rounded, '4 Beds'),
                      _featureItem(Icons.bathtub_rounded, '3 Baths'),
                      _featureItem(Icons.square_foot_rounded, '2,500 sqft'),
                      _featureItem(Icons.garage_rounded, '2 Cars'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  const Text(
                    'Experience luxury living at its finest in this stunning modern villa. Featuring high ceilings, floor-to-ceiling windows, and a private pool, this home is perfect for entertaining and comfortable living.',
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
        child: CustomButton(
          text: 'Schedule a Tour',
          onTap: () {
            Navigator.pushNamed(context, ScheduleTourScreen.routeName, arguments: property);
          },
        ),
      ),
    );
  }

  Widget _featureItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: const Color(0xFFEEF2FF), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: const Color(0xFF6366F1), size: 24),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
