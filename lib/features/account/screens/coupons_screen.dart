import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CouponsScreen extends StatelessWidget {
  static const String routeName = '/coupons';
  const CouponsScreen({super.key});

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
            'My Coupons',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildCouponCard(
            'WELCOME20', 
            '20% OFF', 
            'On your first order above \$50', 
            'Valid until Dec 31, 2026', 
            Colors.purple,
          ),
          _buildCouponCard(
            'FREESHIP', 
            'FREE SHIPPING', 
            'No minimum order value', 
            'Valid until Jan 31, 2026', 
            Colors.orange,
          ),
          _buildCouponCard(
            'SUMMER10', 
            '\$10 FLAT OFF', 
            'On Summer Collection items', 
            'Expired', 
            Colors.grey,
            isExpired: true,
          ),
        ],
      ),
    );
  }

  Widget _buildCouponCard(String code, String offer, String desc, String validity, Color color, {bool isExpired = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: IntrinsicHeight(
          child: Row(
            children: [
              // Left Side (Color Strip)
              Container(
                width: 10,
                color: isExpired ? Colors.grey : color,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(
                             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                             decoration: BoxDecoration(
                               color: isExpired ? Colors.grey.withValues(alpha: 0.1) : color.withValues(alpha: 0.1),
                               borderRadius: BorderRadius.circular(8),
                               border: Border.all(color: isExpired ? Colors.grey : color),
                             ),
                             child: Text(
                               code,
                               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isExpired ? Colors.grey : color),
                             ),
                           ),
                           if (isExpired)
                             const Text('EXPIRED', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey)),
                         ],
                       ),
                       const SizedBox(height: 12),
                       Text(
                         offer,
                         style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: isExpired ? Colors.grey : const Color(0xFF1E293B)),
                       ),
                       const SizedBox(height: 4),
                       Text(
                         desc,
                         style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                       ),
                       const SizedBox(height: 12),
                       Text(
                         validity,
                         style: TextStyle(fontSize: 11, color: isExpired ? Colors.red : Colors.green[700], fontWeight: FontWeight.bold),
                       ),
                    ],
                  ),
                ),
              ),
              // Dashed Line
              Container(
                width: 1,
                color: Colors.grey[300],
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
              // Right Side (Action)
              SizedBox(
                width: 60,
                child: Center(
                   child: IconButton(
                     icon: Icon(Icons.copy_rounded, color: isExpired ? Colors.grey[300] : const Color(0xFF6366F1)),
                     onPressed: isExpired ? null : () {},
                   ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
