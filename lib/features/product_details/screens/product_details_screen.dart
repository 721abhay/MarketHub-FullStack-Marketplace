import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/hub/screens/main_hub_dashboard.dart';
import 'package:amazon_clone/features/product_details/services/product_details_services.dart';
import 'package:amazon_clone/features/product_details/screens/add_review_screen.dart'; // Added
import 'package:amazon_clone/features/product_details/screens/product_reviews_screen.dart'; // Added
import 'package:amazon_clone/features/product_details/screens/price_alert_screen.dart'; // Added
import 'package:amazon_clone/features/product_details/screens/compare_products_screen.dart'; // Added
import 'package:amazon_clone/features/product_details/screens/augmented_reality_screen.dart'; // Added
import 'package:amazon_clone/features/seller/screens/seller_storefront_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _currentImageIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();
  final ProductDetailsServices _productDetailsService = ProductDetailsServices();
  List<Product>? _recommendedProducts;
  double _userRating = 0;

  @override
  void initState() {
    super.initState();
    _fetchRecommendations();
    _checkUserRating();
    _addToRecentlyViewed();
  }

  void _addToRecentlyViewed() {
    _productDetailsService.addToRecentlyViewed(
      context: context,
      product: widget.product,
    );
  }

  void _fetchRecommendations() async {
    _recommendedProducts = await _productDetailsService.fetchRecommendedProducts(
      context: context,
      category: widget.product.category,
    );
    if (mounted) setState(() {});
  }

  void _checkUserRating() {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      if (widget.product.rating![i].userId == user.id) {
        _userRating = widget.product.rating![i].rating;
        break;
      }
    }
  }

  void addToCart() {
    Provider.of<UserProvider>(context, listen: false).addToCart(widget.product);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to Cart!'),
        backgroundColor: Color(0xFF10B981),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void toggleWishlist() {
    _productDetailsService.toggleWishlist(
      context: context,
      product: widget.product,
    );
  }

  void navigateToAddress(double totalPrice) {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
      arguments: totalPrice.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    final bool isInWishlist = user.wishlist.any((item) => item['product']['_id'] == widget.product.id);

    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
    int totalRatings = widget.product.rating!.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            widget.product.name,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            IconButton(
              onPressed: toggleWishlist,
              icon: Icon(
                isInWishlist ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: isInWishlist ? Colors.redAccent : Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share_outlined, color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildImageCarousel(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   _buildProductHeader(avgRating, totalRatings),
                  const SizedBox(height: 32),
                  _buildPriceSection(),
                  const SizedBox(height: 32),
                  _buildActionButtons(),
                  const SizedBox(height: 32),
                  
                  // Product Tools Row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildToolButton(Icons.notifications_active_rounded, 'Price Alert', Colors.orange, () {
                           Navigator.pushNamed(context, PriceAlertScreen.routeName, arguments: widget.product);
                        }),
                        const SizedBox(width: 12),
                        _buildToolButton(Icons.compare_arrows_rounded, 'Compare', Colors.blue, () {
                           Navigator.pushNamed(context, CompareProductsScreen.routeName, arguments: widget.product);
                        }),
                        const SizedBox(width: 12),
                        _buildToolButton(Icons.view_in_ar_rounded, 'View in AR', Colors.purple, () {
                           Navigator.pushNamed(context, AugmentedRealityScreen.routeName, arguments: widget.product);
                        }),
                      ],
                    ),
                  ),

                  const SizedBox(height: 48),
                  _buildSmartServiceIntegration(),
                  const SizedBox(height: 48),
                  _buildSectionTitle('Product Description'),
                  const SizedBox(height: 12),
                  _buildDescription(),
                  const SizedBox(height: 32),
                  _buildSectionTitle('Rate this Product'),
                   const SizedBox(height: 12),
                  _buildRatingEditor(),
                  const SizedBox(height: 48),
                  _buildSectionTitle('Recommended for You'),
                  const SizedBox(height: 16),
                  _buildRecommendationsList(),
                  const SizedBox(height: 48),
                   _buildSectionTitle('Trust & Safety'),
                  const SizedBox(height: 16),
                  _buildBadge(Icons.verified_user_rounded, 'Verified Store', 'This seller is verified by MarketHub teams.'),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, SellerStorefrontScreen.routeName, arguments: 'Premium Seller'),
                    child: _buildBadge(Icons.storefront_rounded, 'Sold By: Premium Seller', 'Visit the brand store for more products.'),
                  ),
                  const SizedBox(height: 16),
                  _buildBadge(Icons.restart_alt_rounded, '7 Days Return', 'Hassle free returns if you change your mind.'),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmartServiceIntegration() {
    String title = '';
    String subtitle = '';
    IconData icon = Icons.auto_awesome;
    Color color = Colors.indigo;

    if (widget.product.category == 'Mobiles') {
      title = 'MarketHub Protection';
      subtitle = 'Add accidental damage protection for \$49';
      icon = Icons.security_rounded;
      color = Colors.blue;
    } else if (widget.product.category == 'Grocery') {
      title = 'Fresh Subscription';
      subtitle = 'Switch to fresh milk delivery subscription';
      icon = Icons.autorenew_rounded;
      color = Colors.green;
    } else {
      title = 'Super Hub Explore';
      subtitle = 'Access 150+ services in MarketHub';
      icon = Icons.hub_rounded;
      color = Colors.purple;
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: color.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 12),
              const Text('HUB SMART CONNECT', style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
            ],
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, MainHubDashboard.routeName),
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: const Text('Connect in Hub', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFF8FAFC)),
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 400,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() => _currentImageIndex = index);
              },
            ),
            items: widget.product.images.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Hero(
                    tag: 'product-${widget.product.id}',
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const ShimmerLoader(width: double.infinity, height: double.infinity),
                      errorWidget: (context, url, error) => const Icon(Icons.error_outline),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.product.images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentImageIndex == entry.key ? const Color(0xFF6366F1) : Colors.grey.withValues(alpha: 0.3),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductHeader(double avgRating, int totalRatings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.product.category,
                style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            Text(
              widget.product.quantity > 0 ? 'In Stock' : 'Out of Stock',
              style: TextStyle(
                color: widget.product.quantity > 0 ? const Color(0xFF10B981) : const Color(0xFFEF4444),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          widget.product.name,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
             RatingBarIndicator(
              rating: avgRating,
              itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
              itemCount: 5,
              itemSize: 20,
              direction: Axis.horizontal,
            ),
            const SizedBox(width: 8),
            Text(
              '($totalRatings ${totalRatings == 1 ? 'Rating' : 'Ratings'})',
              style: const TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Special Price', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              '\$${widget.product.price}',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(width: 12),
            Text(
              '\$${(widget.product.price * 1.2).toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, color: Color(0xFF94A3B8), decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.orange.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
              child: const Text('20% OFF', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'Add to Cart',
            onTap: addToCart,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            text: 'Buy Now',
            onTap: () => navigateToAddress(widget.product.price.toDouble()),
            color: const Color(0xFF8B5CF6),
          ),
        ),
      ],
    );
  }

  Widget _buildToolButton(IconData icon, String label, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.1)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)));
  }

  Widget _buildDescription() {
    return Text(
      widget.product.description,
      style: const TextStyle(fontSize: 15, color: Color(0xFF475569), height: 1.6),
    );
  }

  Widget _buildRatingEditor() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Text('Your opinion matters!', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          RatingBar.builder(
            initialRating: _userRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 40,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(Icons.star_rounded, color: Colors.amber),
            onRatingUpdate: (rating) {
              Navigator.pushNamed(context, AddReviewScreen.routeName, arguments: {'product': widget.product, 'initialRating': rating});
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationsList() {
    if (_recommendedProducts == null) {
      return const Loader();
    }
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _recommendedProducts!.length,
        itemBuilder: (context, index) {
          final product = _recommendedProducts![index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, ProductDetailScreen.routeName, arguments: product),
            child: Container(
              width: 160,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFF1F5F9)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                      child: Image.network(product.images[0], fit: BoxFit.cover, width: double.infinity),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        Text('\$${product.price}', style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
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

  Widget _buildBadge(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(16)),
          child: Icon(icon, color: const Color(0xFF6366F1), size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Text(subtitle, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
