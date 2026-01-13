import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/address/screens/address_screen.dart';
import 'package:amazon_clone/features/product_details/services/product_details_services.dart';
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

    double avgRating = 0;
    int totalRatings = 0;
    if (widget.product.rating != null && widget.product.rating!.isNotEmpty) {
      double totalRating = 0;
      for (int i = 0; i < widget.product.rating!.length; i++) {
        totalRating += widget.product.rating![i].rating;
      }
      avgRating = totalRating / widget.product.rating!.length;
      totalRatings = widget.product.rating!.length;
    }

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
          title: const Text(
            'Product Details',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(
                isInWishlist ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: isInWishlist ? Colors.redAccent : Colors.white,
              ),
              onPressed: toggleWishlist,
            ),
            IconButton(
              icon: const Icon(Icons.share_outlined, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget _buildImageCarousel() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFF8FAFC)),
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            items: widget.product.images.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Hero(
                    tag: widget.product.id ?? UniqueKey().toString(),
                    child: Image.network(imageUrl, fit: BoxFit.contain),
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              height: 400,
              onPageChanged: (index, reason) {
                setState(() => _currentImageIndex = index);
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.product.images.asMap().entries.map((entry) {
                return Container(
                  width: _currentImageIndex == entry.key ? 24 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: _currentImageIndex == entry.key
                        ? const Color(0xFF6366F1)
                        : const Color(0xFFCBD5E1),
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
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1E293B), letterSpacing: -0.5),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            RatingBarIndicator(
              rating: avgRating > 0 ? avgRating : 0,
              itemBuilder: (context, index) => const Icon(Icons.star_rounded, color: Color(0xFFF59E0B)),
              itemCount: 5,
              itemSize: 20.0,
            ),
            const SizedBox(width: 8),
            Text(
              '${avgRating.toStringAsFixed(1)} ($totalRatings reviews)',
              style: const TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$${widget.product.price.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF6366F1)),
        ),
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            '\$${(widget.product.price * 1.25).toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, color: Color(0xFF94A3B8), decoration: TextDecoration.lineThrough),
          ),
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
            color: const Color(0xFFF1F5F9).withOpacity(0.5),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: CustomButton(
            text: 'Buy Now',
            onTap: () => navigateToAddress(widget.product.price),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.product.description,
      style: const TextStyle(fontSize: 16, color: Color(0xFF64748B), height: 1.6),
    );
  }

  Widget _buildRatingEditor() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          RatingBar.builder(
            initialRating: _userRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(Icons.star_rounded, color: Color(0xFFF59E0B)),
            onRatingUpdate: (rating) {
              _productDetailsService.rateProduct(
                context: context,
                product: widget.product,
                rating: rating,
              );
              setState(() => _userRating = rating);
            },
          ),
          const SizedBox(height: 12),
          const Text(
            'Tap to share your experience',
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationsList() {
    if (_recommendedProducts == null) return const Loader();
    if (_recommendedProducts!.isEmpty) return const SizedBox();

    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _recommendedProducts!.length,
        itemBuilder: (context, index) {
          final product = _recommendedProducts![index];
          if (product.id == widget.product.id) return const SizedBox();
          
          return GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                ProductDetailScreen.routeName,
                arguments: product,
              );
            },
            child: Container(
              width: 150,
              margin: const EdgeInsets.only(right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      product.images[0],
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBadge(IconData icon, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF6366F1), size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(desc, style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
