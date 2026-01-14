import 'package:markethub/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ServiceBookingScreen extends StatefulWidget {
  static const String routeName = '/service-booking';
  final String professionalName;
  const ServiceBookingScreen({super.key, required this.professionalName});

  @override
  State<ServiceBookingScreen> createState() => _ServiceBookingScreenState();
}

class _ServiceBookingScreenState extends State<ServiceBookingScreen> {
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Book Service', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(radius: 24, backgroundImage: NetworkImage('https://images.unsplash.com/photo-1540569014015-19a7be504e3a?auto=format&fit=crop&q=80&w=100')),
                      const SizedBox(width: 16),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(widget.professionalName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), const Text('Professional Partner', style: TextStyle(color: Colors.grey, fontSize: 13))]),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text('Select Date', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  CalendarDatePicker(
                    initialDate: _selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 14)),
                    onDateChanged: (date) => setState(() => _selectedDate = date),
                  ),
                  const SizedBox(height: 32),
                  const Text('Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE2E8F0))),
                    child: const Row(
                      children: [
                        Icon(Icons.location_on_rounded, color: Color(0xFF6366F1)),
                        SizedBox(width: 12),
                        Expanded(child: Text('Home: 123, Maple Avenue, Silicon Valley', style: TextStyle(fontSize: 13))),
                        Icon(Icons.edit_outlined, size: 16, color: Colors.grey),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: CustomButton(
              text: 'Confirm Booking',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    title: const Text('Booking Successful!'),
                    content: Text('${widget.professionalName} will arrive on ${_selectedDate.day}/${_selectedDate.month} at your address.'),
                    actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text('Done'))],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
