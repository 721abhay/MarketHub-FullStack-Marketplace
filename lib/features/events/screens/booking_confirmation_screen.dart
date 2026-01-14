import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookingConfirmationScreen extends StatelessWidget {
  static const String routeName = '/booking-confirmation';
  final Map<String, dynamic> bookingData;
  const BookingConfirmationScreen({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 100),
              const SizedBox(height: 24),
              const Text('Booking Confirmed!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Your tickets for ${bookingData['event']} are ready', style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(24), border: Border.all(color: const Color(0xFFE2E8F0))),
                child: Column(
                  children: [
                    const Text('SCAN AT COUNTER', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.5, color: Colors.grey)),
                    const SizedBox(height: 20),
                    const Icon(Icons.qr_code_2_rounded, size: 200, color: Color(0xFF1E293B)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _info('ID', 'MH-98231'),
                        _info('Amount', '\$${bookingData['total']}'),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomButton(text: 'Go to My Tickets', onTap: () => Navigator.popUntil(context, (route) => route.isFirst)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _info(String label, String val) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)), Text(val, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))]);
  }
}
