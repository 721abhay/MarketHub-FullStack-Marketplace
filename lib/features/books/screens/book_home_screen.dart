import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class BookHomeScreen extends StatelessWidget {
  static const String routeName = '/book-home';
  const BookHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCF8), // Paper-like background
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          _buildPersonalGreeting(),
          _buildGenres(),
          _buildBestSellers(),
          _buildNewArrivals(),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xFFFDFCF8),
      floating: true,
      pinned: true,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF78350F)),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text('THE BOOKSHELF', style: TextStyle(color: Color(0xFF78350F), fontWeight: FontWeight.bold, letterSpacing: 1)),
      actions: [
        IconButton(icon: const Icon(Icons.menu_book_rounded, color: Color(0xFF78350F)), onPressed: () {}),
      ],
    );
  }

  Widget _buildPersonalGreeting() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('What will you read today?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Color(0xFF451A03))),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFE2E8F0))),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 15),
                  Text('Search authors, titles...', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenres() {
    final genres = ['Fiction', 'Science', 'History', 'Crime', 'Biography', 'Kids'];
    return SliverToBoxAdapter(
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: const Color(0xFF78350F), borderRadius: BorderRadius.circular(25)),
              child: Text(genres[index], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBestSellers() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('TOP SELLERS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF451A03))),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                   _buildBookCover('https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=400'),
                   _buildBookCover('https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=400'),
                   _buildBookCover('https://images.unsplash.com/photo-1495446815901-a7297e633e8d?q=80&w=400'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookCover(String url) {
    return Container(
      width: 140,
      height: 200,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(4, 4)),
        ],
      ),
    );
  }

  Widget _buildNewArrivals() {
     return SliverToBoxAdapter(child: SizedBox(height: 20)); // Placeholder
  }
}
