import 'package:flutter/material.dart';

class LuxuryBoutiqueHomeScreen extends StatelessWidget {
  static const String routeName = '/luxury-boutique';
  const LuxuryBoutiqueHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Sleek black
      body: CustomScrollView(
        slivers: [
          _buildLuxuryAppBar(context),
          _buildPremiumHero(),
          _buildBrandScroll(),
          _buildLuxuryCategoryGrid(),
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
      title: const Text('L U X U R Y', style: TextStyle(color: Color(0xFFD4AF37), letterSpacing: 8, fontWeight: FontWeight.w300)), // Gold color
      actions: [IconButton(icon: const Icon(Icons.favorite_border, color: Color(0xFFD4AF37)), onPressed: () {})],
    );
  }

  Widget _buildPremiumHero() {
    return SliverToBoxAdapter(
      child: Container(
        height: 500,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1549298916-b41d501d3772?auto=format&fit=crop&q=80&w=800'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.center),
          ),
          padding: const EdgeInsets.all(40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text('THE NEW CLASSIC', style: TextStyle(color: Color(0xFFD4AF37), fontSize: 12, letterSpacing: 4)),
               SizedBox(height: 12),
               Text('Autum Winter 2026', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w100)),
               SizedBox(height: 24),
               Text('SHOP THE COLLECTION', style: TextStyle(color: Colors.white, fontSize: 12, decoration: TextDecoration.underline)),
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
              child: Center(child: Text(brands[index], style: const TextStyle(color: Colors.white70, letterSpacing: 4, fontSize: 14, fontWeight: FontWeight.w300))),
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2, childAspectRatio: 0.8),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              color: const Color(0xFF1A1A1A),
              child: Column(
                children: [
                  Expanded(child: Image.network('https://images.unsplash.com/photo-1584917865442-de89df76afd3?auto=format&fit=crop&q=80&w=300', fit: BoxFit.cover)),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('TIMELESS ACCESSORIES', style: TextStyle(color: Colors.white, fontSize: 10, letterSpacing: 2)),
                  ),
                ],
              ),
            );
          },
          childCount: 4,
        ),
      ),
    );
  }
}
