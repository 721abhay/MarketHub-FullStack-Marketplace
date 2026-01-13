import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  final String? badge;
  const SearchedProduct({
    super.key,
    required this.product,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    double avgRating = 0;
    if (product.rating != null && product.rating!.isNotEmpty) {
      double totalRating = 0;
      for (int i = 0; i < product.rating!.length; i++) {
        totalRating += product.rating![i].rating;
      }
      avgRating = totalRating / product.rating!.length;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  ),
                  child: Image.network(
                    product.images[0],
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[100],
                      child: const Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    
                    // Rating
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: avgRating > 0 ? avgRating : 4.5,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          itemCount: 5,
                          itemSize: 14.0,
                          direction: Axis.horizontal,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(12.5k)',
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    
                    // Price
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text(
                          '\$',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${product.price.toInt()}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.price.toStringAsFixed(2).split('.')[1],
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 4),
                        if (product.price < 300)
                          Text(
                            '\$${(product.price * 1.2).toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[500],
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    
                    // Prime & Delivery
                    Row(
                      children: [
                        Image.network(
                          'https://m.media-amazon.com/images/I/41OOf+3pNoL.png', // Small prime badge icon
                          height: 16,
                          errorBuilder: (context, error, stackTrace) => const Text(
                            'prime',
                            style: TextStyle(
                                color: Color(0xFF00A8E1),
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Tomorrow, Mar 12',
                          style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    
                    // Add to Cart Button
                    SizedBox(
                      width: double.infinity,
                      height: 32,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFA41C),
                          foregroundColor: Colors.black,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          // Badge (Best Seller / Limited Deal)
          if (badge != null)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badge!.contains('Best') ? const Color(0xFFE67A00) : const Color(0xFFCC0C39),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  badge!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
          // Favorite Icon
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: const Icon(Icons.favorite_border, size: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
