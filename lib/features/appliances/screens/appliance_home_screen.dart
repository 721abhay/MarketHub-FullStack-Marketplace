import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class ApplianceHomeScreen extends StatelessWidget {
  static const String routeName = '/appliance-home';
  const ApplianceHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          _buildCategoryFilter(),
          _buildPromoSection(),
          _buildFeaturedProducts(),
          _buildServiceBanner(),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      floating: true,
      pinned: true,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text('SMART APPLIANCES', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
      actions: [
        IconButton(icon: const Icon(Icons.help_outline_rounded, color: Colors.black), onPressed: () {}),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    final categories = [
      {'name': 'Washers', 'icon': Icons.wash_rounded},
      {'name': 'Fridges', 'icon': Icons.kitchen_rounded},
      {'name': 'TVs', 'icon': Icons.tv_rounded},
      {'name': 'ACs', 'icon': Icons.ac_unit_rounded},
      {'name': 'Kitchen', 'icon': Icons.microwave_rounded},
    ];
    return SliverToBoxAdapter(
      child: Container(
        height: 110,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            return Container(
              width: 80,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                   CircleAvatar(
                     backgroundColor: const Color(0xFFF1F5F9),
                     child: Icon(categories[index]['icon'] as IconData, color: const Color(0xFF6366F1)),
                   ),
                   const SizedBox(height: 8),
                   Text(categories[index]['name'] as String, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPromoSection() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('UPGRADE YOUR HOME', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Exchange your old appliances and get up to \$500 off.', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
                    child: const Text('Start Exchange'),
                  ),
                ],
              ),
            ),
            const Icon(Icons.swap_horiz_rounded, size: 60, color: Colors.white24),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedProducts() {
     return SliverToBoxAdapter(child: SizedBox(height: 20)); // Placeholder
  }

  Widget _buildServiceBanner() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(20)),
        child: const Row(
          children: [
            Icon(Icons.verified_user_rounded, color: Colors.blue),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Premium Installation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text('Free professional setup for all major appliances.', style: TextStyle(fontSize: 11, color: Colors.blueGrey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
