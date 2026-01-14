import 'package:amazon_clone/features/entertainment/screens/video_player_screen.dart';
import 'package:flutter/material.dart';

class PrimeVideoHomeScreen extends StatelessWidget {
  static const String routeName = '/prime-video';
  const PrimeVideoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F171E), // Dark theme
      body: CustomScrollView(
        slivers: [
          _buildEntertainmentAppBar(),
          _buildFeaturedCarousel(),
          _buildCategoryShelf('New Releases'),
          _buildCategoryShelf('Watch Next'),
          _buildCategoryShelf('Award Winning Movies'),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildEntertainmentAppBar() {
    return SliverAppBar(
      backgroundColor: const Color(0xFF0F171E).withValues(alpha: 0.9),
      pinned: true,
      title: const Text('MarketHub Video', style: TextStyle(color: Color(0xFF00A8E1), fontWeight: FontWeight.bold)),
      actions: [IconButton(icon: const Icon(Icons.cast, color: Colors.white), onPressed: () {}), IconButton(icon: const Icon(Icons.person_outline, color: Colors.white), onPressed: () {})],
    );
  }

  Widget _buildFeaturedCarousel() {
    return SliverToBoxAdapter(
      child: Container(
        height: 250,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), image: const DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1536440136628-849c177e76a1?auto=format&fit=crop&q=80&w=600'), fit: BoxFit.cover)),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryShelf(String title) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(20, 24, 20, 16), child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, VideoPlayerScreen.routeName, arguments: 'Blockbuster Movie $index'),
                  child: Container(width: 120, margin: const EdgeInsets.only(right: 12), decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(8), image: const DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1485846234645-a62644ef7467?auto=format&fit=crop&q=80&w=300'), fit: BoxFit.cover))),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
