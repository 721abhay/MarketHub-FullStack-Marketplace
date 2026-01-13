import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/order_details/screens/order_details_screen.dart';
import 'package:amazon_clone/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YourOrdersScreen extends StatefulWidget {
  static const String routeName = '/your-orders';
  const YourOrdersScreen({super.key});

  @override
  State<YourOrdersScreen> createState() => _YourOrdersScreenState();
}

class _YourOrdersScreenState extends State<YourOrdersScreen> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Your Orders',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: orders == null
          ? const Loader()
          : orders!.isEmpty
              ? _buildEmptyOrders()
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

  Widget _buildEmptyOrders() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 20),
          const Text(
            'No orders yet!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your future purchases will appear here.',
            style: TextStyle(color: Color(0xFF94A3B8)),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Order order) {
    final date = DateFormat('MMM dd, yyyy').format(DateTime.fromMillisecondsSinceEpoch(order.orderedAt));
    final isDelivered = order.status >= 3;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          OrderDetailScreen.routeName,
          arguments: order,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      order.products[0].images[0],
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #${order.id.substring(order.id.length - 8).toUpperCase()}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF6366F1)),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          order.products.length > 1 
                            ? '${order.products[0].name} & ${order.products.length - 1} more'
                            : order.products[0].name,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Ordered on $date',
                          style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        isDelivered ? Icons.check_circle_rounded : Icons.local_shipping_rounded,
                        size: 16,
                        color: isDelivered ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        isDelivered ? 'Delivered' : 'On its way',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isDelivered ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '\$${order.totalPrice}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E293B)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
