import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/features/social/screens/community_profile_screen.dart'; // Added
import 'package:markethub/features/social/screens/create_post_screen.dart';
import 'package:markethub/features/social/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';

class CommunityFeedScreen extends StatelessWidget {
  static const String routeName = '/community-feed';
  const CommunityFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data for Feed
    final List<Map<String, dynamic>> posts = [
      {
        'id': '1',
        'username': 'Jessica Style',
        'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=100&q=80',
        'image': 'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&w=800&q=80',
        'caption': 'Loving this new summer outfit! The material is so breathable. #SummerVibes #Fashion',
        'likes': 1204,
        'comments': 45,
      },
      {
        'id': '2',
        'username': 'TechGuru_99',
        'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=100&q=80',
        'image': 'https://images.unsplash.com/photo-1550009158-9ebf69173e03?auto=format&fit=crop&w=800&q=60',
        'caption': 'Unboxing the new noise cancelling headphones. The bass is insane! 🎧',
        'likes': 856,
        'comments': 120,
      },
      {
        'id': '3',
        'username': 'HomeDecorBySarah',
        'avatar': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=100&q=80',
        'image': 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?auto=format&fit=crop&w=800&q=80',
        'caption': 'Finally set up my reading corner. That chair is everything. 🛋️',
        'likes': 2300,
        'comments': 89,
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
            'Community Feed',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_box_outlined, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, CreatePostScreen.routeName);
              },
            ),
          ],
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
                 PostDetailScreen.routeName, 
                 arguments: post,
               );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                             Navigator.pushNamed(
                               context, 
                               CommunityProfileScreen.routeName, 
                               arguments: post['username'],
                             );
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(post['avatar']),
                                radius: 20,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                post['username'],
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.more_vert, color: Colors.grey),
                      ],
                    ),
                  ),
                  
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24), // Rounded corners for image
                    child: Image.network(
                      post['image'],
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Actions
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.favorite_border_rounded, size: 28, color: Color(0xFFEF4444)),
                        const SizedBox(width: 6),
                        Text('${post['likes']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(width: 24),
                        const Icon(Icons.chat_bubble_outline_rounded, size: 26, color: Color(0xFF64748B)),
                        const SizedBox(width: 6),
                         Text('${post['comments']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const Spacer(),
                        const Icon(Icons.bookmark_border_rounded, size: 28, color: Color(0xFF64748B)),
                      ],
                    ),
                  ),

                  // Caption
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Color(0xFF1E293B), fontSize: 14),
                        children: [
                          TextSpan(
                            text: '${post['username']} ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: post['caption']),
                        ],
                      ),
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
