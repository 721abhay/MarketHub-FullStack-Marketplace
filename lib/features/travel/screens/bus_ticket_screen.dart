import 'package:markethub/common/widgets/shimmer_loader.dart';
import 'package:markethub/features/hub/services/hub_services.dart';
import 'package:markethub/models/service_models.dart';
import 'package:flutter/material.dart';

class BusTicketScreen extends StatefulWidget {
  static const String routeName = '/bus-tickets';
  const BusTicketScreen({super.key});

  @override
  State<BusTicketScreen> createState() => _BusTicketScreenState();
}

class _BusTicketScreenState extends State<BusTicketScreen> {
  final HubServices hubServices = HubServices();
  List<TravelDeal>? busDeals;

  @override
  void initState() {
    super.initState();
    _loadBuses();
  }

  void _loadBuses() async {
    final deals = await hubServices.fetchTravelDeals(context: context);
    setState(() {
      busDeals = deals['buses'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Bus Bookings', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: busDeals == null
          ? ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: 3,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: ShimmerLoader(width: double.infinity, height: 180),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: busDeals!.length,
              itemBuilder: (context, index) {
                return _buildBusCard(busDeals![index]);
              },
            ),
    );
  }

  Widget _buildBusCard(TravelDeal bus) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bus.type,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  bus.from, // operator name in our mapping
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.star_rounded, size: 16, color: Colors.orange),
                    const SizedBox(width: 4),
                    const Text('4.8 • Top Rated', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.event_seat_rounded, size: 14, color: Colors.indigo),
                    const SizedBox(width: 4),
                    const Text('Available Anytime', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${bus.price.toInt()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFF6366F1),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text('Select'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
