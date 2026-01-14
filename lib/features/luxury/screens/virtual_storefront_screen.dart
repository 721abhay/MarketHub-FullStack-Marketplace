import 'package:flutter/material.dart';

class VirtualStorefrontScreen extends StatelessWidget {
  static const String routeName = '/virtual-storefront';
  const VirtualStorefrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(child: Image.network('https://images.unsplash.com/photo-1541339907198-e08756ebafe3?auto=format&fit=crop&q=80&w=800', fit: BoxFit.cover)), // Mall/Store image
          Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black.withValues(alpha: 0.7), Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.center))),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context),
                const Spacer(),
                _buildCollectionSlider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
          const Text('V I R T U A L   S T O R E', style: TextStyle(color: Colors.white, letterSpacing: 4, fontWeight: FontWeight.w300)),
          const Icon(Icons.info_outline, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildCollectionSlider() {
    return Container(
      height: 300,
      margin: const EdgeInsets.only(bottom: 40),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: 250,
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.white24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(radius: 40, backgroundImage: NetworkImage('https://images.unsplash.com/photo-1579338559194-a162d19bf842?auto=format&fit=crop&q=80&w=200')),
                const Spacer(),
                const Text('Summer Collection', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                const Text('Available Now', style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 20),
                TextButton(onPressed: () {}, child: const Text('ENTER STORE', style: TextStyle(color: Colors.white, letterSpacing: 2))),
              ],
            ),
          );
        },
      ),
    );
  }
}
