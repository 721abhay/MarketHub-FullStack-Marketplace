import 'package:flutter/material.dart';

class MyBookingsScreen extends StatelessWidget {
  static const String routeName = '/my-bookings';
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('My Bookings'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              labelColor: Color(0xFF6366F1),
              indicatorColor: Color(0xFF6366F1),
              tabs: [Tab(text: 'Upcoming'), Tab(text: 'Completed')],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildBookingsList(true),
                  _buildBookingsList(false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingsList(bool isUpcoming) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: isUpcoming ? 1 : 3,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)]),
          child: Column(
            children: [
              Row(
                children: [
                   Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.blue[50], shape: BoxShape.circle), child: const Icon(Icons.flight, color: Color(0xFF6366F1))),
                   const SizedBox(width: 16),
                   const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('New York (JFK)', style: TextStyle(fontWeight: FontWeight.bold)), Text('Confirmed • ID: MH-89234', style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold))])),
                   const Text('15 Jan 2026', style: TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
              if (isUpcoming) ...[
                const Divider(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF1F5F9), foregroundColor: Colors.black, elevation: 0), child: const Text('View Ticket')),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
