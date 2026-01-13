import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';
import 'package:amazon_clone/features/seller/services/seller_services.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SellerOrdersScreen extends StatefulWidget {
  const SellerOrdersScreen({super.key});

  @override
  State<SellerOrdersScreen> createState() => _SellerOrdersScreenState();
}

class _SellerOrdersScreenState extends State<SellerOrdersScreen> {
  List<Order>? orders;
  final SellerServices sellerServices = SellerServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    // Note: We need a fetchSellerOrders in SellerServices
    // For now, I'll update SellerServices to include this or fetch via API here
    List<Order> fetchedOrders = await _fetchSellerOrdersFromAPI();
    setState(() {
      orders = fetchedOrders;
    });
  }

  Future<List<Order>> _fetchSellerOrdersFromAPI() async {
     // I'll call the existing endpoint I created in server
     final user = Provider.of<UserProvider>(context, listen: false).user;
     // Re-using the logic from SellerServices to keep it consistent
     return await sellerServices.fetchSellerOrders(context: context, sellerId: user.id);
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
            'Order Management',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: orders == null
          ? const Loader()
          : orders!.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: orders!.length,
                  itemBuilder: (context, index) {
                    final order = orders![index];
                    return _buildOrderCard(order);
                  },
                ),
    );
  }

  Widget _buildEmptyState() {
     return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.assignment_turned_in_rounded, size: 80, color: Colors.grey.shade300),
            const SizedBox(height: 20),
            const Text(
              'No Active Orders',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 8),
            const Text(
              'When you receive orders, they will appear here.',
              style: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
            ),
          ],
        ),
      );
  }

  Widget _buildOrderCard(Order order) {
    final date = DateFormat('MMM dd, yyyy').format(DateTime.fromMillisecondsSinceEpoch(order.orderedAt));
    final statusText = _getStatusText(order.status);
    final statusColor = _getStatusColor(order.status);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          OrderDetailScreen.routeName,
          arguments: order,
        ).then((_) => fetchOrders()); // Refresh on back
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.inventory_2_outlined, color: Color(0xFF6366F1)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #${order.id.substring(order.id.length - 8).toUpperCase()}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          '$date • ${order.products.length} Items',
                          style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 14, color: Color(0xFF94A3B8)),
                      const SizedBox(width: 4),
                      SizedBox(
                        width: 150,
                        child: Text(
                          order.address,
                          style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '\$${order.totalPrice}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF6366F1)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getStatusText(int status) {
    if (status == 0) return 'Pending';
    if (status == 1) return 'Processing';
    if (status == 2) return 'Shipped';
    if (status == 3) return 'Delivered';
    return 'Completed';
  }

  Color _getStatusColor(int status) {
    if (status == 0) return const Color(0xFF64748B);
    if (status == 1) return const Color(0xFF6366F1);
    if (status == 2) return const Color(0xFFF59E0B);
    if (status == 3) return const Color(0xFF10B981);
    return const Color(0xFF10B981);
  }
}
