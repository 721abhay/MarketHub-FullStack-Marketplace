import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/features/account/screens/your_orders_screen.dart';
import 'package:markethub/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class OrderSuccessScreen extends StatelessWidget {
  static const String routeName = '/order-success';
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: Color(0xFF16A34A),
                    size: 80,
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Order Confirmed!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0F172A), letterSpacing: -1),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your payment was successful and your order is now on its way to you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 60),
                CustomButton(
                  text: 'Continue Shopping',
                  onTap: () => Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, YourOrdersScreen.routeName),
                  child: const Text(
                    'Track My Order',
                    style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
