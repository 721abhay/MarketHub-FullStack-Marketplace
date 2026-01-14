import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/features/content/screens/blog_post_screen.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  static const String routeName = '/blog';
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Blog Data
    final List<Map<String, String>> posts = [
      {
        'title': 'Top 10 Gadgets of 2026',
        'subtitle': 'Discover the future of tech with our curated list of must-have devices.',
        'image': 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=800&q=80',
        'date': 'Jan 10, 2026',
        'author': 'Tech Team',
      },
      {
        'title': 'Sustainable Fashion: A Guide',
        'subtitle': 'How to build a wardrobe that looks good and does good for the planet.',
        'image': 'https://images.unsplash.com/photo-1523381210434-271e8be1f52b?auto=format&fit=crop&w=800&q=80',
        'date': 'Jan 05, 2026',
        'author': 'Style Ed.',
      },
      {
        'title': 'Home Decor Trends for Spring',
        'subtitle': 'Refresh your living space with these vibrant and airy design ideas.',
        'image': 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?auto=format&fit=crop&w=800&q=80',
        'date': 'Dec 28, 2025',
        'author': 'Sarah J.',
      },
       {
        'title': 'The Ultimate Coffee Guide',
        'subtitle': 'From bean to cup, everything you need to know about brewing the perfect coffee.',
        'image': 'https://images.unsplash.com/photo-1497935586351-b67a49e012bf?auto=format&fit=crop&w=800&q=80',
        'date': 'Dec 15, 2025',
        'author': 'Brew Master',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'MarketHub Insights',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return GestureDetector(
            onTap: () {
               Navigator.pushNamed(
                 context, 
                 BlogPostScreen.routeName, 
                 arguments: post,
               );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      post['image']!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post['title']!,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post['subtitle']!,
                          style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              post['date']!,
                              style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                            ),
                             Text(
                              'By ${post['author']}',
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF6366F1)),
                            ),
                          ],
                        ),
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
}
