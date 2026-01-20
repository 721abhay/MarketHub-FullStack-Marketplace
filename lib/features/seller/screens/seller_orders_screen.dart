import 'package:markethub/common/widgets/shimmer_loader.dart';
import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/features/seller/screens/seller_order_detail_screen.dart';
import 'package:markethub/features/seller/services/seller_services.dart';
import 'package:markethub/models/order.dart';
import 'package:flutter/material.dart';
import 'package:markethub/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class SellerOrdersScreen extends StatefulWidget {
  static const String routeName = '/seller-orders';
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
    orders = await sellerServices.fetchSellerOrders(context: context, sellerId: user.id);
    if (mounted) setState(() {});
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
            'Manage Orders',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: orders == null
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 4,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: ShimmerLoader(width: double.infinity, height: 180, borderRadius: 20),
              ),
            )
          : RefreshIndicator(
              onRefresh: () async => fetchOrders(),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: orders!.length,
                itemBuilder: (context, index) {
                  final orderData = orders![index];
                  final formattedDate = DateFormat('MMM dd, yyyy').format(DateTime.fromMillisecondsSinceEpoch(orderData.orderedAt));
                  
                  return GestureDetector(
                    onTap: () {
                       Navigator.pushNamed(
                         context,
                         SellerOrderDetailScreen.routeName,
                         arguments: orderData,
                       );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.03), 
                            blurRadius: 15, 
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order #${orderData.id.substring(orderData.id.length - 8).toUpperCase()}',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF6366F1)),
                                    ),
                                    Text(
                                      formattedDate,
                                      style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                _buildStatusBadge(orderData.status),
                              ],
                            ),
                            const Divider(height: 32, color: Color(0xFFF1F5F9)),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    imageUrl: orderData.products[0].images[0],
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const ShimmerLoader(width: 70, height: 70, borderRadius: 12),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        orderData.products[0].name,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1E293B)),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        orderData.products.length > 1 
                                          ? '+ ${orderData.products.length - 1} more items'
                                          : 'Single Item Order',
                                        style: const TextStyle(color: Color(0xFF64748B), fontSize: 12, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Payout Amount',
                                  style: TextStyle(color: Color(0xFF94A3B8), fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                                Text(
                                  '\$${orderData.totalPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget _buildStatusBadge(int status) {
    String text;
    Color color;
    switch (status) {
      case 0:
        text = 'Pending';
        color = Colors.orange;
        break;
      case 1:
        text = 'Completed';
        color = Colors.green;
        break;
      case 2:
        text = 'Shipped';
        color = Colors.blue;
        break;
      case 3:
        text = 'Delivered';
        color = Colors.purple;
        break;
      default:
        text = 'Unknown';
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}
