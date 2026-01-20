import 'package:flutter/material.dart';
import 'package:markethub/features/luxury/services/luxury_services.dart';
import 'package:markethub/models/service_models.dart';
import 'package:markethub/common/widgets/loader.dart';

class LuxuryBoutiqueHomeScreen extends StatefulWidget {
  static const String routeName = '/luxury-boutique';
  const LuxuryBoutiqueHomeScreen({super.key});

  @override
  State<LuxuryBoutiqueHomeScreen> createState() => _LuxuryBoutiqueHomeScreenState();
}

class _LuxuryBoutiqueHomeScreenState extends State<LuxuryBoutiqueHomeScreen> {
  final LuxuryServices luxuryServices = LuxuryServices();
  List<LuxuryProduct>? luxuryProducts;

  @override
  void initState() {
    super.initState();
    fetchLuxuryProducts();
  }

  void fetchLuxuryProducts() async {
    luxuryProducts = await luxuryServices.fetchLuxuryProducts(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildLuxuryAppBar(context),
          _buildPremiumHero(),
          _buildBrandScroll(),
          luxuryProducts == null
              ? const SliverToBoxAdapter(child: Loader())
              : _buildLuxuryCategoryGrid(),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildLuxuryAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 80,
      backgroundColor: Colors.black,
      pinned: true,
      centerTitle: true,
      title: const Text('L U X U R Y',
          style: TextStyle(
              color: Color(0xFFD4AF37),
              letterSpacing: 8,
              fontWeight: FontWeight.w300)),
      actions: [
        IconButton(
            icon: const Icon(Icons.favorite_border, color: Color(0xFFD4AF37)),
            onPressed: () {})
      ],
    );
  }

  Widget _buildPremiumHero() {
    return SliverToBoxAdapter(
      child: Container(
        height: 500,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1549298916-b41d501d3772?auto=format&fit=crop&q=80&w=800'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center),
          ),
          padding: const EdgeInsets.all(40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('THE NEW CLASSIC',
                  style: TextStyle(
                      color: Color(0xFFD4AF37), fontSize: 12, letterSpacing: 4)),
              SizedBox(height: 12),
              Text('Autum Winter 2026',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w100)),
              SizedBox(height: 24),
              Text('SHOP THE COLLECTION',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      decoration: TextDecoration.underline)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandScroll() {
    final brands = ['GUCCI', 'PRADA', 'DIOR', 'HERMES', 'CHANEL'];
    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 32),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: brands.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Center(
                  child: Text(brands[index],
                      style: const TextStyle(
                          color: Colors.white70,
                          letterSpacing: 4,
                          fontSize: 14,
                          fontWeight: FontWeight.w300))),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLuxuryCategoryGrid() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.7),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = luxuryProducts![index];
            return Container(
              color: const Color(0xFF1A1A1A),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Image.network(product.imageUrl, fit: BoxFit.cover, width: double.infinity)),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.brand.toUpperCase(),
                            style: const TextStyle(
                                color: Color(0xFFD4AF37),
                                fontSize: 9,
                                letterSpacing: 2)),
                        const SizedBox(height: 4),
                        Text(product.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w300)),
                        const SizedBox(height: 8),
                        Text('\$${product.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          childCount: luxuryProducts!.length,
        ),
      ),
    );
  }
}

