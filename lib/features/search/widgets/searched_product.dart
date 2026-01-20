import 'package:markethub/common/widgets/shimmer_loader.dart';
import 'package:markethub/models/product.dart';
import 'package:markethub/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

    final bool isOutOfStock = product.quantity <= 0;
    final bool isLowStock = product.quantity > 0 && product.quantity < 5;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
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
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Hero(
                    tag: product.id ?? UniqueKey().toString(),
                    child: Opacity(
                      opacity: isOutOfStock ? 0.5 : 1.0,
                      child: CachedNetworkImage(
                        imageUrl: product.images[0],
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const ShimmerLoader(width: double.infinity, height: double.infinity),
                      ),
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: avgRating > 0 ? avgRating : 0,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFF59E0B),
                          ),
                          itemCount: 5,
                          itemSize: 14.0,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          avgRating.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 11, color: Color(0xFF64748B), fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6366F1),
                          ),
                        ),
                        if (isLowStock)
                          Text(
                            'Only ${product.quantity} left',
                            style: const TextStyle(color: Color(0xFFEF4444), fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    
                    // Add to Cart Button
                    SizedBox(
                      width: double.infinity,
                      height: 36,
                      child: ElevatedButton(
                        onPressed: isOutOfStock ? null : () {
                          Provider.of<UserProvider>(context, listen: false).addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to Cart!'), backgroundColor: Color(0xFF10B981)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isOutOfStock ? const Color(0xFFE2E8F0) : const Color(0xFF6366F1),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(isOutOfStock ? Icons.block : Icons.add_shopping_cart, size: 14),
                            const SizedBox(width: 4),
                            Text(isOutOfStock ? 'Sold Out' : 'Add', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          if (badge != null || isOutOfStock)
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isOutOfStock 
                    ? const Color(0xFF64748B) 
                    : (badge!.contains('Best') ? const Color(0xFF6366F1) : const Color(0xFFEF4444)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  isOutOfStock ? 'OUT OF STOCK' : badge!,
                  style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
