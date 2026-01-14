import 'package:markethub/features/travel/screens/seat_selection_screen.dart';
import 'package:flutter/material.dart';

class FlightSearchScreen extends StatelessWidget {
  static const String routeName = '/flight-search';
  const FlightSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('Flights to New York'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, SeatSelectionScreen.routeName),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.grey[200]!)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFlightInfo('08:00', 'ORD', 'Non-stop'),
                      _buildDurationInfo('2h 30m'),
                      _buildFlightInfo('11:30', 'JFK', 'Terminal 4'),
                    ],
                  ),
                  const Divider(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(children: [CircleAvatar(radius: 12, backgroundImage: NetworkImage('https://logo.clearbit.com/united.com')), SizedBox(width: 8), Text('United Airlines', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))]),
                      Text('\$${245 + index * 10}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF6366F1))),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFlightInfo(String time, String code, String sub) {
    return Column(children: [Text(time, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text(code, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey)), Text(sub, style: const TextStyle(fontSize: 11, color: Colors.grey))]);
  }

  Widget _buildDurationInfo(String dur) {
    return Column(children: [Text(dur, style: const TextStyle(fontSize: 12, color: Colors.grey)), Container(width: 60, height: 1, color: Colors.grey[300]), const Icon(Icons.flight_takeoff, size: 14, color: Colors.grey)]);
  }
}
