import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/features/account/widgets/single_product.dart';
import 'package:markethub/features/order_details/screens/order_details_screen.dart';
import 'package:markethub/models/order.dart';
import 'package:markethub/models/product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  // Mock orders for UI demonstration
  List<Order> orders = [
    Order(
      id: 'ord_123',
      products: [
        Product(
          name: 'iPhone 15 Pro Max',
          description: 'Latest iPhone',
          quantity: 1,
          images: ['https://m.media-amazon.com/images/I/81+GIkwqLIL._AC_UY327_FMwebp_QL65_.jpg'],
          category: 'Mobiles',
          price: 1199,
          id: '1',
          rating: [],
        ),
      ],
      quantity: [1],
      address: '123 Fake Street, Tech City',
      userId: 'user_1',
      orderedAt: DateTime.now().millisecondsSinceEpoch - 86400000,
      status: 2,
      totalPrice: 1199,
    ),
    Order(
      id: 'ord_456',
      products: [
        Product(
          name: 'Men\'s Running Shoes',
          description: 'Comfortable shoes',
          quantity: 1,
          images: ['https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'],
          category: 'Fashion',
          price: 59,
          id: 'f1',
          rating: [],
        ),
      ],
      quantity: [1],
      address: '456 Innovation Ave, Silicon Valley',
      userId: 'user_1',
      orderedAt: DateTime.now().millisecondsSinceEpoch - 172800000,
      status: 0,
      totalPrice: 59,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: Text(
                'See all',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            ),
          ],
        ),
        // display orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    OrderDetailScreen.routeName,
                    arguments: orders[index],
                  );
                },
                child: SingleProduct(
                  image: orders[index].products[0].images[0],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
