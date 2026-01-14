import 'package:markethub/common/widgets/shimmer_loader.dart';
import 'package:markethub/features/hub/services/hub_services.dart';
import 'package:markethub/features/travel/screens/bus_ticket_screen.dart';
import 'package:markethub/features/travel/screens/flight_search_screen.dart';
import 'package:markethub/features/travel/screens/hotel_booking_screen.dart';
import 'package:markethub/features/travel/screens/train_ticket_screen.dart';
import 'package:markethub/models/service_models.dart';
import 'package:flutter/material.dart';

class TravelHomeScreen extends StatefulWidget {
  static const String routeName = '/travel-home';
  const TravelHomeScreen({super.key});

  @override
  State<TravelHomeScreen> createState() => _TravelHomeScreenState();
}

class _TravelHomeScreenState extends State<TravelHomeScreen> {
  final HubServices hubServices = HubServices();
  List<TravelDeal>? flightDeals;

  @override
  void initState() {
    super.initState();
    _loadDeals();
  }

  void _loadDeals() async {
    final deals = await hubServices.fetchTravelDeals(context: context);
    setState(() {
      flightDeals = deals['flights'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Travel Bookings', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildSearchCard(context),
            const SizedBox(height: 32),
            _buildServiceIcons(context),
            const SizedBox(height: 32),
            _buildSpecialOffers(),
            const SizedBox(height: 24),
            _buildFlightDealsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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
        children: [
          Row(
            children: [
              _buildTripType('One Way', true),
              const SizedBox(width: 12),
              _buildTripType('Round Trip', false),
            ],
          ),
          const SizedBox(height: 24),
          _buildLocationInput(Icons.flight_takeoff, 'From', 'Chicago (ORD)'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Icon(Icons.swap_vert, color: Color(0xFF6366F1)),
          ),
          _buildLocationInput(Icons.flight_land, 'To', 'New York (JFK)'),
          const SizedBox(height: 24),
          const Row(
            children: [
              Expanded(child: _DetailInput(Icons.calendar_today, 'Departure', '15 Jan 2026')),
              SizedBox(width: 16),
              Expanded(child: _DetailInput(Icons.person, 'Travelers', '1 Adult')),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, FlightSearchScreen.routeName),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Search Flights', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTripType(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF6366F1) : Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildLocationInput(IconData icon, String label, String val) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            Text(val, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceIcons(BuildContext context) {
    final services = [
      {'name': 'Flights', 'icon': Icons.flight, 'route': FlightSearchScreen.routeName},
      {'name': 'Hotels', 'icon': Icons.hotel, 'route': HotelBookingScreen.routeName},
      {'name': 'Buses', 'icon': Icons.directions_bus, 'route': BusTicketScreen.routeName},
      {'name': 'Trains', 'icon': Icons.train, 'route': TrainTicketScreen.routeName},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: services
          .map((s) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (s['route'] != null) {
                      Navigator.pushNamed(context, s['route'] as String);
                    }
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.indigo[50],
                        child: Icon(s['icon'] as IconData, color: const Color(0xFF6366F1)),
                      ),
                      const SizedBox(height: 8),
                      Text(s['name'] as String, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildSpecialOffers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Featured Adventure', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: const DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&q=80&w=800'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withValues(alpha: 0.8), Colors.transparent],
              ),
            ),
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Maldives Escape', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Get 30% off on all-inclusive villas', style: TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFlightDealsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Exclusive Flight Deals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        if (flightDeals == null)
          const ShimmerLoader(width: double.infinity, height: 100)
        else
          ...flightDeals!.map((deal) => _buildDealCard(deal)),
      ],
    );
  }

  Widget _buildDealCard(TravelDeal deal) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(deal.imageUrl, width: 40, height: 40, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${deal.from} → ${deal.to}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(deal.type, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${deal.price.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6366F1), fontSize: 18)),
              const Text('per person', style: TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailInput extends StatelessWidget {
  final IconData icon;
  final String label;
  final String val;
  const _DetailInput(this.icon, this.label, this.val);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
              Text(val, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
