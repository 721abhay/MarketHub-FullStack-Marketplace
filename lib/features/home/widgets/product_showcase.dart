import 'package:amazon_clone/common/widgets/glass_container.dart';
import 'package:amazon_clone/common/widgets/shimmer_loader.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductShowcase extends StatelessWidget {
  final String title;
  final List<Product> products;
  final bool isLoading;

  const ProductShowcase({
    super.key,
    required this.title,
    required this.products,
    this.isLoading = false,
  });

  void navigateToDetails(BuildContext context, Product product) {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
              ),
              const Text(
                'See all',
                style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 240,
          child: isLoading 
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 3,
                itemBuilder: (context, index) => const ProductSkeleton(),
              )
            : ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () => navigateToDetails(context, product),
                child: Hero(
                  tag: 'product-${product.id}',
                  child: GlassContainer(
                    borderRadius: 20,
                    color: Colors.white.withValues(alpha: 0.6),
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      width: 160,
                      child: Material(
                        color: Colors.transparent,
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF8FAFC),
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                              ),
                              child: Center(
                                child: CachedNetworkImage(
                                  imageUrl: product.images[0],
                                  fit: BoxFit.contain,
                                  placeholder: (context, url) => const ShimmerLoader(width: 160, height: 160),
                                  errorWidget: (context, url, error) => const Icon(Icons.error_outline),
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
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1E293B)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\$${product.price.toStringAsFixed(2)}',
                                  style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ),
                    ),
                    ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
