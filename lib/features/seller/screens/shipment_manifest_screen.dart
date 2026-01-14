import 'package:amazon_clone/models/order.dart';
import 'package:flutter/material.dart';

class ShipmentManifestScreen extends StatelessWidget {
  static const String routeName = '/shipment-manifest';
  final Order order;
  const ShipmentManifestScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Print Preview'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.print)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        ],
      ),
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('PRIORITY MAIL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  Container(
                    padding: const EdgeInsets.all(8),
                     decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: const Text('P', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  ),
                ],
              ),
              const Divider(thickness: 2, color: Colors.black),
              const SizedBox(height: 16),
              
              // From Address
              const Text('FROM:', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              const Text('MarketHub Fulfillment Center', style: TextStyle(fontSize: 12)),
              const Text('123 Commerce Way, Tech City', style: TextStyle(fontSize: 12)),
              const Text('State 94043', style: TextStyle(fontSize: 12)),

              const SizedBox(height: 24),

               // To Address
              const Text('SHIP TO:', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              const Text('John Doe', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), // Mock Name
              Text(order.address, style: const TextStyle(fontSize: 14)), // Real Address
              
              const SizedBox(height: 32),
              
               // Barcode
              Container(
                height: 80,
                 color: Colors.black,
                 width: double.infinity,
                 child: const Center(
                   child: Text(
                     '||| || ||||| |||| |||| || |||',
                     style: TextStyle(color: Colors.white, fontSize: 24, letterSpacing: 4),
                   ),
                 ),
              ),
              const Center(child: Text('1234 5678 9101 1121', style: TextStyle(fontSize: 12))),
              
              const Divider(thickness: 2, color: Colors.black),
              
              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order: #${order.id.substring(0,8).toUpperCase()}'),
                  const Text('Weight: 1.2 kg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
