import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/features/seller/services/seller_services.dart';
import 'package:markethub/features/seller/screens/shipment_manifest_screen.dart';
import 'package:markethub/models/order.dart';
import 'package:flutter/material.dart';

class SellerOrderDetailScreen extends StatefulWidget {
  static const String routeName = '/seller-order-detail';
  final Order order;
  const SellerOrderDetailScreen({super.key, required this.order});

  @override
  State<SellerOrderDetailScreen> createState() => _SellerOrderDetailScreenState();
}

class _SellerOrderDetailScreenState extends State<SellerOrderDetailScreen> {
  int currentStep = 0;
  final SellerServices sellerServices = SellerServices();

  @override
  void initState() {
    super.initState();
    currentStep = widget.order.status;
  }

  void changeOrderStatus(int status) {
    sellerServices.updateOrderStatus(
      context: context,
      status: status + 1,
      orderId: widget.order.id,
      onSuccess: () {
        setState(() {
          currentStep += 1;
        });
      },
    );
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
            'Order Details',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             _buildSectionTitle('Customer Info'),
             const SizedBox(height: 12),
             Container(
               padding: const EdgeInsets.all(16),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(12),
                 boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   _buildInfoRow(Icons.person, 'Customer Name', 'John Doe'), // Mock Name if not in model
                   const Divider(),
                   _buildInfoRow(Icons.location_on, 'Shipping Address', widget.order.address),
                   const Divider(),
                   _buildInfoRow(Icons.confirmation_number, 'Order ID', widget.order.id),
                 ],
               ),
             ),
             
             const SizedBox(height: 24),
             _buildSectionTitle('Items'),
             const SizedBox(height: 12),
             ...widget.order.products.map((product) => Container(
               margin: const EdgeInsets.only(bottom: 12),
               padding: const EdgeInsets.all(12),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(12),
                 border: Border.all(color: const Color(0xFFE2E8F0)),
               ),
               child: Row(
                 children: [
                   Image.network(product.images[0], height: 50, width: 50, fit: BoxFit.cover),
                   const SizedBox(width: 12),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1),
                         Text('Qty: ${widget.order.quantity[0]}', style: const TextStyle(color: Colors.grey)), // Simplified
                       ],
                     ),
                   ),
                   Text('\$${product.price}', style: const TextStyle(fontWeight: FontWeight.bold)),
                 ],
               ),
             )),

             const SizedBox(height: 24),
             _buildSectionTitle('Actions'),
             const SizedBox(height: 12),
             Container(
               padding: const EdgeInsets.all(20),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(16),
               ),
               child: Column(
                 children: [
                   Stepper(
                     currentStep: currentStep,
                     controlsBuilder: (context, details) {
                       if (currentStep > 3) return const SizedBox();
                       return Padding(
                         padding: const EdgeInsets.only(top: 16),
                         child: ElevatedButton(
                           onPressed: () => changeOrderStatus(currentStep),
                           style: ElevatedButton.styleFrom(
                             backgroundColor: GlobalVariables.secondaryColor,
                             minimumSize: const Size(double.infinity, 45),
                           ),
                           child: Text(
                             'Update Status to ${_getNextStatus(currentStep)}',
                             style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                           ),
                         ),
                       );
                     },
                     steps: [
                       Step(title: const Text('Pending'), content: const Text('Order received'), isActive: currentStep >= 0, state: currentStep > 0 ? StepState.complete : StepState.indexed),
                       Step(title: const Text('Completed'), content: const Text('Order processed'), isActive: currentStep >= 1, state: currentStep > 1 ? StepState.complete : StepState.indexed),
                       Step(title: const Text('Shipped'), content: const Text('Handed to courier'), isActive: currentStep >= 2, state: currentStep > 2 ? StepState.complete : StepState.indexed),
                       Step(title: const Text('Delivered'), content: const Text('Package arrived'), isActive: currentStep >= 3, state: currentStep >= 3 ? StepState.complete : StepState.indexed),
                     ],
                   ),
                 ],
               ),
             ),
             
             const SizedBox(height: 24),
             Row(
               children: [
                 Expanded(
                   child: ElevatedButton.icon(
                     onPressed: () {
                        Navigator.pushNamed(context, ShipmentManifestScreen.routeName, arguments: widget.order);
                     },
                     icon: const Icon(Icons.print_rounded),
                     label: const Text('Print Label'),
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.white,
                       foregroundColor: Colors.black,
                       padding: const EdgeInsets.symmetric(vertical: 16),
                     ),
                   ),
                 ),
                 const SizedBox(width: 16),
                  Expanded(
                   child: ElevatedButton.icon(
                     onPressed: () {},
                     icon: const Icon(Icons.chat_bubble_outline),
                     label: const Text('Contact Customer'),
                     style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.white,
                       foregroundColor: Colors.black,
                       padding: const EdgeInsets.symmetric(vertical: 16),
                     ),
                   ),
                 ),
               ],
             ),
          ],
        ),
      ),
    );
  }

  String _getNextStatus(int step) {
    if (step == 0) return 'Completed';
    if (step == 1) return 'Shipped';
    if (step == 2) return 'Delivered';
    return 'Done';
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)));
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}
