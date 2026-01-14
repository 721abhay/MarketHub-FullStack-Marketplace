import 'package:markethub/constants/global_variables.dart';
import 'package:flutter/material.dart';

class InventoryReportScreen extends StatelessWidget {
  static const String routeName = '/inventory-report';
  const InventoryReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Inventory Data
    final inventory = [
      {'name': 'iPhone 15 Pro', 'stock': 4, 'status': 'Low Stock'},
      {'name': 'MacBook Air M2', 'stock': 45, 'status': 'Healthy'},
      {'name': 'Sony WH-1000XM5', 'stock': 0, 'status': 'Out of Stock'},
      {'name': 'Nike Air Jordan', 'stock': 12, 'status': 'Healthy'},
      {'name': 'Samsung Galaxy S24', 'stock': 2, 'status': 'Critical'},
    ];

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
            'Inventory Health',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: inventory.length,
        itemBuilder: (context, index) {
          final item = inventory[index];
          final stock = item['stock'] as int;
          Color statusColor = Colors.green;
          if (stock == 0) {
            statusColor = Colors.red;
          } else if (stock < 5) {
            statusColor = Colors.orange;
          }

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.inventory_2_outlined, color: statusColor, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Stock Level: $stock units',
                        style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    item['status'] as String,
                    style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
