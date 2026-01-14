import 'package:amazon_clone/features/real_estate/screens/property_detail_screen.dart';
import 'package:flutter/material.dart';

class RealEstateHomeScreen extends StatelessWidget {
  static const String routeName = '/real-estate-home';
  const RealEstateHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('MarketHub Properties'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildQuickSearch(),
            const SizedBox(height: 32),
             _buildSection('Featured Listings'),
             _buildPropertyCard(context, 'Modern Villa', 'Austin, TX', '\$850,000', 'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?auto=format&fit=crop&q=80&w=600'),
             _buildPropertyCard(context, 'Luxury Condominium', 'Miami, FL', '\$420,000', 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&q=80&w=600'),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickSearch() {
    return Row(
      children: [
        _quickItem('Buy', true),
        const SizedBox(width: 12),
        _quickItem('Rent', false),
        const SizedBox(width: 12),
        _quickItem('Sell', false),
      ],
    );
  }

  Widget _quickItem(String label, bool isSelected) {
    return Expanded(child: Container(padding: const EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color: isSelected ? const Color(0xFF1E293B) : Colors.grey[100], borderRadius: BorderRadius.circular(12)), child: Text(label, textAlign: TextAlign.center, style: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.bold))));
  }

  Widget _buildSection(String title) {
     return Padding(padding: const EdgeInsets.symmetric(vertical: 24), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), const Text('See All', style: TextStyle(color: Colors.blue, fontSize: 13))]));
  }

  Widget _buildPropertyCard(BuildContext context, String title, String loc, String price, String img) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, PropertyDetailScreen.routeName, arguments: {'title': title, 'image': img}),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(24)), child: Image.network(img, height: 200, width: double.infinity, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), Text(loc, style: const TextStyle(color: Colors.grey, fontSize: 13))]),
                  Text(price, style: const TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
