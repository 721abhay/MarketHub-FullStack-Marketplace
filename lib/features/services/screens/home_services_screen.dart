import 'package:markethub/common/widgets/shimmer_loader.dart';
import 'package:markethub/features/hub/services/hub_services.dart';
import 'package:markethub/features/services/screens/service_booking_screen.dart';
import 'package:markethub/models/service_models.dart';
import 'package:flutter/material.dart';

class ServiceProfessionalScreen extends StatefulWidget {
  static const String routeName = '/home-services';
  const ServiceProfessionalScreen({super.key});

  @override
  State<ServiceProfessionalScreen> createState() => _ServiceProfessionalScreenState();
}

class _ServiceProfessionalScreenState extends State<ServiceProfessionalScreen> {
  final HubServices hubServices = HubServices();
  List<HomeService>? homeServices;

  @override
  void initState() {
    super.initState();
    _loadServices();
  }

  void _loadServices() async {
    final list = await hubServices.fetchHomeServices(context: context);
    setState(() {
      homeServices = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Home Services', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Professional Help for Your Home', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Verified professionals for every task at your doorstep.', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 32),
            _buildServiceCategories(),
            const SizedBox(height: 40),
            const Text('Highly Rated Near You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            if (homeServices == null)
              const Column(
                children: [
                  ShimmerLoader(width: double.infinity, height: 120),
                  SizedBox(height: 16),
                  ShimmerLoader(width: double.infinity, height: 120),
                ],
              )
            else
              ...homeServices!.map((service) => _buildProfessionalCard(service)),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCategories() {
    final categories = [
      {'name': 'Plumbing', 'icon': Icons.plumbing},
      {'name': 'Electrical', 'icon': Icons.electrical_services},
      {'name': 'Cleaning', 'icon': Icons.cleaning_services},
      {'name': 'AC Repair', 'icon': Icons.ac_unit},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories
          .map((c) => Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)],
                      ),
                      child: Icon(c['icon'] as IconData, color: const Color(0xFF6366F1)),
                    ),
                    const SizedBox(height: 8),
                    Text(c['name'] as String, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget _buildProfessionalCard(HomeService service) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(service.imageUrl, width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(service.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                    Text(' ${service.rating}', style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Starts at \$${service.price.toInt()}', style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, ServiceBookingScreen.routeName, arguments: service.title),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6366F1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 0,
            ),
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }
}
