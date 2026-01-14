import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  static const String routeName = '/wishlist';
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    
    // Safely parse wishlist items
    List<Product> wishlistProducts = [];
    for (int i = 0; i < user.wishlist.length; i++) {
      if (user.wishlist[i]['product'] != null) {
        try {
          wishlistProducts.add(Product.fromMap(user.wishlist[i]['product']));
        } catch (e) {
          // Skip invalid products
          debugPrint('Error parsing wishlist item: $e');
        }
      }
    }
  
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Your Wishlist',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: wishlistProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                  const SizedBox(height: 20),
                  const Text(
                    'Your wishlist is empty',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : GridView.builder(
              itemCount: wishlistProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7, // Adjust card height
              ),
              itemBuilder: (context, index) {
                final product = wishlistProducts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductDetailScreen.routeName,
                      arguments: product,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: GlobalVariables.glassmorphicDecoration.copyWith(
                       color: Colors.white, // Opaque for now, can be glass
                       borderRadius: BorderRadius.circular(10),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black.withValues(alpha: 0.05),
                           blurRadius: 5,
                           spreadRadius: 1,
                         )
                       ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(product.images[0]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$${product.price}',
                                style: TextStyle(
                                  color: GlobalVariables.selectedNavBarColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Remove button could go here
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
