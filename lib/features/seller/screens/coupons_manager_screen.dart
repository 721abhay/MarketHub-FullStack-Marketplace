import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CouponsManagerScreen extends StatefulWidget {
  static const String routeName = '/coupons-manager';
  const CouponsManagerScreen({super.key});

  @override
  State<CouponsManagerScreen> createState() => _CouponsManagerScreenState();
}

class _CouponsManagerScreenState extends State<CouponsManagerScreen> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _minOrderController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    _discountController.dispose();
    _minOrderController.dispose();
    super.dispose();
  }

  void createCoupon() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Coupon Created Successfully!')),
    );
     Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Create Coupon',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Coupon Code', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  CustomTextField(controller: _codeController, hintText: 'e.g. SUMMER20'),
                  
                  const SizedBox(height: 20),
                  
                  const Text('Discount Percentage (%)', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  CustomTextField(controller: _discountController, hintText: 'e.g. 20'),

                   const SizedBox(height: 20),
                  
                  const Text('Min Order Value (\$)', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  CustomTextField(controller: _minOrderController, hintText: 'e.g. 50.00'),

                   const SizedBox(height: 32),
                   CustomButton(text: 'Create Coupon', onTap: createCoupon),
                ],
              ),
            ),

            const SizedBox(height: 32),
            const Text('Active Coupons', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
             _buildActiveCoupon('WELCOME10', '10% Off', 'Active'),
             _buildActiveCoupon('FLASH50', '50% Off', 'Paused'),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveCoupon(String code, String offer, String status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(code, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(offer, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
          Container(
             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
             decoration: BoxDecoration(
               color: status == 'Active' ? Colors.green.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
               borderRadius: BorderRadius.circular(20),
             ),
             child: Text(status, style: TextStyle(color: status == 'Active' ? Colors.green : Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
