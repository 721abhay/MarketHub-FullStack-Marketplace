import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class FashionHomeScreen extends StatelessWidget {
  static const String routeName = '/fashion-home';
  const FashionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          _buildHeroSection(),
          _buildCategories(),
          _buildFeaturedCollections(),
          _buildTrendingNow(),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'FASHION HUB',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
        ),
      ),
      actions: [
        IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
        IconButton(icon: const Icon(Icons.favorite_border, color: Colors.black), onPressed: () {}),
      ],
    );
  }

  Widget _buildHeroSection() {
    return SliverToBoxAdapter(
      child: Container(
        height: 450,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1490481651871-ab68de25d43d?q=80&w=1200&auto=format&fit=crop'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withValues(alpha: 0.7), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'WINTER\nCOLLECTION 2026',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  height: 1,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Elevate your style with our latest arrivals.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                ),
                child: const Text('SHOP NOW', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    final categories = ['Men', 'Women', 'Kids', 'Accessories', 'Shoes'];
    return SliverToBoxAdapter(
      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                categories[index],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeaturedCollections() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('COLLECTIONS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: _buildCollectionCard('STREETWEAR', 'https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?q=80&w=400')),
                const SizedBox(width: 15),
                Expanded(child: _buildCollectionCard('MINIMALIST', 'https://images.unsplash.com/photo-1434389677669-e08b4cac3105?q=80&w=400')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollectionCard(String title, String imageUrl) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Container(
        color: Colors.black26,
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
      ),
    );
  }

  Widget _buildTrendingNow() {
    return sliverSectionHeader('TRENDING NOW');
  }

  Widget sliverSectionHeader(String title) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverToBoxAdapter(
        child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
      ),
    );
  }
}
