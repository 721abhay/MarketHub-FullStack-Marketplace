import 'package:flutter/material.dart';

class GamePassScreen extends StatelessWidget {
  static const String routeName = '/gaming-pass';
  const GamePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(expandedHeight: 250, pinned: true, backgroundColor: Colors.black, flexibleSpace: FlexibleSpaceBar(title: const Text('GAMING HUB', style: TextStyle(letterSpacing: 4, fontWeight: FontWeight.w900, color: Colors.greenAccent)), background: Image.network('https://images.unsplash.com/photo-1542751371-adc38448a05e?auto=format&fit=crop&q=80&w=800', fit: BoxFit.cover))),
          _buildGamingStats(),
          _buildFeaturedGames(),
        ],
      ),
    );
  }

  Widget _buildGamingStats() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(child: _StatCard('Level 42', Icons.star, Colors.purple)),
            const SizedBox(width: 16),
            Expanded(child: _StatCard('128 Games', Icons.videogame_asset, Colors.green)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedGames() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 0.75),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(20), image: const DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1552824719-7909fee0f01a?auto=format&fit=crop&q=80&w=300'), fit: BoxFit.cover)));
          },
          childCount: 4,
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  const _StatCard(this.label, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(24), border: Border.all(color: color.withValues(alpha: 0.3))), child: Row(children: [Icon(icon, color: color), const SizedBox(width: 12), Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]));
  }
}
