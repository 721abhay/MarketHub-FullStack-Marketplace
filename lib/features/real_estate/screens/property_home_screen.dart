import 'package:markethub/common/widgets/shimmer_loader.dart';
import 'package:markethub/features/hub/services/hub_services.dart';
import 'package:markethub/features/real_estate/screens/property_detail_screen.dart';
import 'package:markethub/models/service_models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RealEstateHomeScreen extends StatefulWidget {
  static const String routeName = '/real-estate-home';
  const RealEstateHomeScreen({super.key});

  @override
  State<RealEstateHomeScreen> createState() => _RealEstateHomeScreenState();
}

class _RealEstateHomeScreenState extends State<RealEstateHomeScreen> {
  final HubServices hubServices = HubServices();
  List<RealEstateProperty>? properties;

  @override
  void initState() {
    super.initState();
    _loadProperties();
  }

  void _loadProperties() async {
    final list = await hubServices.fetchProperties(context: context);
    setState(() {
      properties = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('MarketHub Properties', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1E293B),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildQuickSearch(),
            const SizedBox(height: 32),
            _buildSection('Featured Listings'),
            if (properties == null)
              const Column(
                children: [
                   ShimmerLoader(width: double.infinity, height: 250),
                   SizedBox(height: 24),
                   ShimmerLoader(width: double.infinity, height: 250),
                ],
              )
            else
              ...properties!.map((p) => _buildPropertyCard(p)),
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
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1E293B) : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Text('See All', style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildPropertyCard(RealEstateProperty property) {
    final currencyFormat = NumberFormat.simpleCurrency();
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, PropertyDetailScreen.routeName, arguments: {'title': property.title, 'image': property.imageUrl}),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  child: Image.network(property.imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: Color(0xFF1E293B).withValues(alpha: 0.8), borderRadius: BorderRadius.circular(8)),
                    child: Text(property.type, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(property.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18), overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on_rounded, size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(property.location, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    currencyFormat.format(property.price),
                    style: const TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
