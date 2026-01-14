import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class CompareProductsScreen extends StatelessWidget {
  static const String routeName = '/compare-products';
  final Product product1;
  const CompareProductsScreen({super.key, required this.product1});

  @override
  Widget build(BuildContext context) {
    // Mock Competitor Product
    final Product product2 = Product(
      name: 'Competitor ${product1.name}',
      description: 'Similar product with different specs.',
      quantity: 10,
      images: ['https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=400&q=80'],
      category: product1.category,
      price: product1.price * 1.1,
      id: 'comp_1',
    );

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
          title: const Text(
            'Compare Products',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Row (Images & Names)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: _buildProductHeader(product1)),
                  Container(width: 1, height: 150, color: Colors.grey[300]),
                  Expanded(child: _buildProductHeader(product2)),
                ],
              ),
            ),
            const Divider(thickness: 1),
            
            // Stats Rows
            _buildStatRow('Price', '\$${product1.price}', '\$${product2.price.toStringAsFixed(2)}', highlightFirst: product1.price < product2.price),
            _buildStatRow('Rating', '4.5 ★', '4.2 ★', highlightFirst: true),
            _buildStatRow('Battery', '24 Hours', '20 Hours', highlightFirst: true),
            _buildStatRow('Warranty', '1 Year', '2 Years', highlightFirst: false),
            _buildStatRow('Shipping', 'Free', '\$5.99', highlightFirst: true),
            _buildStatRow('Material', 'Aluminum', 'Plastic', highlightFirst: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProductHeader(Product product) {
    return Column(
      children: [
        Image.network(product.images[0], height: 100, width: 100, fit: BoxFit.contain),
        const SizedBox(height: 12),
        Text(
          product.name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildStatRow(String label, String val1, String val2, {bool? highlightFirst}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              val1,
              textAlign: TextAlign.center,
               style: TextStyle(
                fontWeight: FontWeight.w600,
                color: (highlightFirst != null && highlightFirst) ? Colors.green : Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                label,
                style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Text(
              val2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: (highlightFirst != null && !highlightFirst) ? Colors.green : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
