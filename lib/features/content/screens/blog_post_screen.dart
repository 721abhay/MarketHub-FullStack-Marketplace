import 'package:markethub/constants/global_variables.dart';
import 'package:flutter/material.dart';

class BlogPostScreen extends StatelessWidget {
  static const String routeName = '/blog-post';
  final Map<String, String> post;
  
  const BlogPostScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                post['image']!,
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: GlobalVariables.secondaryColor,
            elevation: 0,
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                 Text(
                   post['title']!,
                   style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                 ),
                 const SizedBox(height: 12),
                 Row(
                   children: [
                     const Icon(Icons.calendar_today_rounded, size: 16, color: Colors.grey),
                     const SizedBox(width: 8),
                     Text(post['date']!, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                     const SizedBox(width: 24),
                     const Icon(Icons.person_outline_rounded, size: 18, color: Colors.grey),
                     const SizedBox(width: 8),
                     Text(post['author']!, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                   ],
                 ),
                 const Divider(height: 48),
                 Text(
                   post['subtitle']!,
                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, color: Color(0xFF475569)),
                 ),
                 const SizedBox(height: 24),
                 // Mock Content text
                 const Text(
                   '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

1. Innovation is Key
Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris.

2. Design Matters
Integer in volutpat libero. An aesthetically pleasing design can significantly improve user experience and engagement.

3. Sustainability
Phasellus magna. In hac habitasse platea dictumst. Curabitur at lacus ac velit ornare lobortis.

Conclusion
Cras placerat accumsan nulla. Nullam rutrum. Nam vestibulum accumsan nisl.
                   ''',
                   style: TextStyle(fontSize: 16, height: 1.80, color: Color(0xFF334155)),
                 ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
