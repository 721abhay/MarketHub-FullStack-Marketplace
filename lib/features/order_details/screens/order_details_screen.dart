import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/order_details/screens/return_request_screen.dart'; // Added
import 'package:amazon_clone/features/order_details/screens/return_status_screen.dart'; // Added
import 'package:amazon_clone/features/seller/services/seller_services.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderDetailScreen extends StatefulWidget {
  static const String routeName = '/order-details';
  final Order order;
  const OrderDetailScreen({
    super.key,
    required this.order,
  });

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  int currentStep = 0;
  final SellerServices sellerServices = SellerServices();

  @override
  void initState() {
    super.initState();
    currentStep = widget.order.status;
  }

  // ONLY FOR SELLER/ADMIN
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
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Order Tracking',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HERO STATUS SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                   Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'ID: #${widget.order.id.substring(widget.order.id.length - 8).toUpperCase()}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    currentStep >= 3 ? 'Package Delivered!' : 'In Progress',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Order placed on ${DateFormat('MMM dd, yyyy').format(DateTime.fromMillisecondsSinceEpoch(widget.order.orderedAt))}',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TRACKING STEPPER
                  const Text(
                    'Shipment Journey',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(height: 16),
                  _buildTrackingStepper(),

                  const SizedBox(height: 32),
                  
                  // ITEMS SECTION
                  const Text(
                    'Order Summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(height: 16),
                  _buildOrderSummaryCard(),

                  const SizedBox(height: 32),

                  // ADDRESS SECTION
                  const Text(
                    'Shipping Address',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(height: 16),
                  _buildAddressCard(),

                  const SizedBox(height: 40),

                  // SELLER CONTROLS
                  if (user.type == 'admin' || user.type == 'seller') ...[
                    const Divider(),
                    const SizedBox(height: 20),
                    const Text(
                      'Merchant Controls',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: currentStep >= 3 ? 'Order Completed' : 'Move to Next Stage',
                      onTap: currentStep >= 3 ? () {} : () => changeOrderStatus(currentStep),
                      color: currentStep >= 3 ? Colors.grey : const Color(0xFF6366F1),
                    ),
                     const SizedBox(height: 20),
                  ],

                  // BUYER CONTROLS (Returns)
                  if (user.type == 'user' && currentStep >= 3) ...[
                     const Divider(),
                     const SizedBox(height: 20),
                     CustomButton(
                       text: 'Return or Exchange Item',
                       onTap: () {
                         Navigator.pushNamed(
                           context, 
                           ReturnRequestScreen.routeName,
                           arguments: widget.order,
                         );
                       },
                       color: Colors.redAccent,
                     ),
                  ],
                  
                  // Mock button to see Status
                  if (user.type == 'user') ...[
                    const SizedBox(height: 12),
                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.pushNamed(context, ReturnStatusScreen.routeName),
                        child: const Text('View Return Status (Demo)', style: TextStyle(color: Colors.blue)),
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingStepper() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildStepItem(0, 'Order Placed', 'We have received your order.', Icons.shopping_bag_outlined),
          _buildStepDivider(0),
          _buildStepItem(1, 'Processing', 'Seller is preparing your items.', Icons.inventory_2_outlined),
          _buildStepDivider(1),
          _buildStepItem(2, 'Shipped', 'Your package is on its way.', Icons.local_shipping_outlined),
          _buildStepDivider(2),
          _buildStepItem(3, 'Delivered', 'Package arrived at destination.', Icons.check_circle_outline),
        ],
      ),
    );
  }

  Widget _buildStepItem(int step, String title, String subtitle, IconData icon) {
    bool isCompleted = currentStep >= step;
    bool isActive = currentStep == step;
    Color color = isCompleted ? const Color(0xFF6366F1) : const Color(0xFFCBD5E1);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: isCompleted ? const Color(0xFF1E293B) : const Color(0xFF94A3B8),
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: isCompleted ? const Color(0xFF64748B) : const Color(0xFFCBD5E1),
                ),
              ),
            ],
          ),
        ),
        if (isActive)
          const Icon(Icons.radio_button_checked_rounded, color: Color(0xFF6366F1), size: 16),
      ],
    );
  }

  Widget _buildStepDivider(int step) {
    bool isCompleted = currentStep > step;
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: 24,
      width: 2,
      color: isCompleted ? const Color(0xFF6366F1) : const Color(0xFFE2E8F0),
    );
  }

  Widget _buildOrderSummaryCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          for (int i = 0; i < widget.order.products.length; i++)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.order.products[i].images[0],
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.order.products[i].name,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Quantity: ${widget.order.quantity[i]}',
                          style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$${widget.order.products[i].price}',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6366F1)),
                  ),
                ],
              ),
            ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Amount', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(
                  '\$${widget.order.totalPrice}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF6366F1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.location_on_rounded, color: Color(0xFF6366F1)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              widget.order.address,
              style: const TextStyle(color: Color(0xFF475569), fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
