import 'package:flutter/material.dart';

class VenueMapScreen extends StatelessWidget {
  static const String routeName = '/venue-map';
  const VenueMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      appBar: AppBar(title: const Text('Select Seats'), backgroundColor: Colors.transparent, foregroundColor: Colors.white, elevation: 0),
      body: Column(
        children: [
          const SizedBox(height: 48),
          _buildStage(),
          const SizedBox(height: 60),
          Expanded(child: _buildSeatGrid()),
          _buildLegend(),
          _buildBookingFooter(),
        ],
      ),
    );
  }

  Widget _buildStage() {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(8)),
      child: const Center(child: Text('STAGE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 4))),
    );
  }

  Widget _buildSeatGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6, mainAxisSpacing: 12, crossAxisSpacing: 12),
      itemCount: 48,
      itemBuilder: (context, index) {
        bool isBooked = index % 7 == 0;
        return Container(decoration: BoxDecoration(color: isBooked ? Colors.white10 : Colors.white24, borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.white24)));
      },
    );
  }

  Widget _buildLegend() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _legendItem('Available', Colors.white24),
          const SizedBox(width: 20),
          _legendItem('Booked', Colors.white10),
          const SizedBox(width: 20),
          _legendItem('Selected', const Color(0xFFF43F5E)),
        ],
      ),
    );
  }

  Widget _legendItem(String label, Color color) {
    return Row(children: [Container(width: 12, height: 12, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))), const SizedBox(width: 8), Text(label, style: const TextStyle(color: Colors.white, fontSize: 11))]);
  }

  Widget _buildBookingFooter() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('2 Seats Selected', style: TextStyle(fontWeight: FontWeight.bold)),
          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF43F5E), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Confirm Booking')),
        ],
      ),
    );
  }
}
