import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductReviewsScreen extends StatelessWidget {
  static const String routeName = '/product-reviews';
  final Product product;
  const ProductReviewsScreen({super.key, required this.product});

  // Mock Reviews Data
  final List<Map<String, dynamic>> reviews = const [
    {
      'username': 'Alice Johnson',
      'rating': 4.5,
      'date': 'Oct 12, 2025',
      'text': 'Great product! The quality is amazing for the price. Fast delivery too.',
      'image': null
    },
    {
      'username': 'David Smith',
      'rating': 5.0,
      'date': 'Sep 28, 2025',
      'text': 'Absolutely love it. Fits perfectly and looks exactly like the pictures.',
      'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80'
    },
     {
      'username': 'Maria Garcia',
      'rating': 3.0,
      'date': 'Sep 15, 2025',
      'text': 'It is okay, but the color is slightly different than shown. Decent quality though.',
      'image': null
    },
  ];

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
            'Customer Reviews',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // SUMMARY CARD
          Container(
             padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        '4.5',
                         style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                         ),
                      ),
                      RatingBarIndicator(
                        rating: 4.5,
                        itemBuilder: (context, index) => const Icon(Icons.star_rounded, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 20.0,
                      ),
                      const SizedBox(height: 4),
                      const Text('128 Reviews', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      children: [
                        _buildRatingBarRow(5, 0.7),
                        _buildRatingBarRow(4, 0.2),
                        _buildRatingBarRow(3, 0.05),
                        _buildRatingBarRow(2, 0.03),
                        _buildRatingBarRow(1, 0.02),
                      ],
                    ),
                  )
                ],
              ),
          ),
          const SizedBox(height: 24),
          const Text(
            'User Reviews',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
          ),
           const SizedBox(height: 12),
           ...reviews.map((review) => _buildReviewItem(review)),
        ],
      ),
    );
  }

  Widget _buildRatingBarRow(int star, double pct) {
    return Row(
      children: [
        Text('$star', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        const Icon(Icons.star_rounded, size: 12, color: Colors.grey),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 8,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.amber),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewItem(Map<String, dynamic> review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                review['username'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                review['date'],
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 6),
          RatingBarIndicator(
            rating: review['rating'],
            itemBuilder: (context, index) => const Icon(Icons.star_rounded, color: Colors.amber),
            itemCount: 5,
            itemSize: 16.0,
          ),
          const SizedBox(height: 10),
          Text(
            review['text'],
            style: const TextStyle(color: Color(0xFF334155), height: 1.4),
          ),
          if (review['image'] != null) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                review['image'],
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
