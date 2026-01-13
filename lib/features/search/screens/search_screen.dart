import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/features/search/widgets/searched_product.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({
    super.key,
    required this.searchQuery,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Mock products for UI demonstration matching the mockup
  List<Product> products = [
    Product(
      name: 'Wireless Noise Cancelling Headphones, Over Ear,...',
      description: 'Experience pure sound with industry-leading noise cancellation.',
      quantity: 10,
      images: ['https://m.media-amazon.com/images/I/71+GIkwqLIL._AC_UY327_FMwebp_QL65_.jpg'],
      category: 'Electronics',
      price: 249.99,
      id: '1',
      rating: [Rating(userId: '1', rating: 4.5)],
    ),
    Product(
      name: 'Double-Wall Vacuum Insulated Stainless Ste...',
      description: 'Keeps drinks cold for 24 hours or hot for 12 hours.',
      quantity: 50,
      images: ['https://m.media-amazon.com/images/I/61mIu-Kog0L._AC_SX679_.jpg'],
      category: 'Home',
      price: 19.00,
      id: '2',
      rating: [Rating(userId: '1', rating: 5.0)],
    ),
    Product(
      name: '4K UHD Smart Fire TV 50" with Alexa Voice...',
      description: 'Stunning 4K picture quality and access to thousands of channels.',
      quantity: 5,
      images: ['https://m.media-amazon.com/images/I/71VbHaAqbML._AC_SL1500_.jpg'],
      category: 'Electronics',
      price: 320.00,
      id: '3',
      rating: [Rating(userId: '1', rating: 4.2)],
    ),
    Product(
      name: 'Lightweight Running Shoes Breathable Mes...',
      description: 'Comfortable and stylish running shoes for every day.',
      quantity: 20,
      images: ['https://m.media-amazon.com/images/I/71u968bE-aL._AC_UY695_.jpg'],
      category: 'Fashion',
      price: 65.50,
      id: '4',
      rating: [Rating(userId: '1', rating: 4.8)],
    ),
  ];

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int cartLen = user.cart.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          elevation: 0,
          title: Container(
            height: 42,
            margin: const EdgeInsets.only(left: 0),
            child: Material(
              borderRadius: BorderRadius.circular(7),
              elevation: 1,
              child: TextFormField(
                initialValue: widget.searchQuery,
                onFieldSubmitted: navigateToSearchScreen,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.black, size: 23),
                  suffixIcon: const Icon(Icons.center_focus_weak, color: Colors.grey, size: 23),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(top: 10),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search Amazon',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
                  onPressed: () {},
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      cartLen.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Filter Chips matching mockup
          Container(
            height: 48,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _FilterChip(label: 'Prime', hasDropdown: true),
                _FilterChip(label: 'Price', hasDropdown: true),
                _FilterChip(label: 'Rating', hasDropdown: true),
                _FilterChip(label: 'Sort By', hasDropdown: true, isAction: true),
              ],
            ),
          ),
          
          // Address Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: const Color(0xFFF7F7F7),
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 18, color: Colors.black87),
                const SizedBox(width: 8),
                Text(
                  'Deliver to New York 10001',
                  style: TextStyle(
                    fontSize: 14, 
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: products.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.search_off, size: 80, color: Colors.black26),
                        const SizedBox(height: 10),
                        Text(
                          'No results for "${widget.searchQuery}"',
                          style: const TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Text(
                          'Results for "${widget.searchQuery}"',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(12),
                          itemCount: products.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.52,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ProductDetailScreen.routeName,
                                  arguments: products[index],
                                );
                              },
                              child: SearchedProduct(
                                product: products[index],
                                badge: index == 1 ? 'Best Seller' : (index == 3 ? 'Limited Deal' : null),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool hasDropdown;
  final bool isAction;

  const _FilterChip({
    required this.label,
    this.hasDropdown = false,
    this.isAction = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!, width: 0.5),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13, 
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (hasDropdown) ...[
              const SizedBox(width: 4),
              Icon(
                isAction ? Icons.sort : Icons.keyboard_arrow_down,
                size: 16,
                color: Colors.black87,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
