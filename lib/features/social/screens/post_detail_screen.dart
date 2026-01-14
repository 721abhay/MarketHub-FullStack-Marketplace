import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  static const String routeName = '/post-detail';
  final Map<String, dynamic> post;
  const PostDetailScreen({super.key, required this.post});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final TextEditingController _commentController = TextEditingController();

  // Mock Comments
  final List<Map<String, String>> comments = [
    {'user': 'Alex', 'text': 'This looks amazing! Where did you get it?'},
    {'user': 'Sarah_22', 'text': 'Need this in my life asap.'},
    {'user': 'MikeD', 'text': 'Great photo quality!'},
  ];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        comments.add({'user': 'You', 'text': _commentController.text});
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Post Details',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   // Post Image
                   Image.network(
                     widget.post['image'],
                     width: double.infinity,
                     fit: BoxFit.cover,
                   ),
                   Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           children: [
                             CircleAvatar(
                               backgroundImage: NetworkImage(widget.post['avatar']),
                               radius: 18,
                             ),
                             const SizedBox(width: 12),
                             Text(
                               widget.post['username'],
                               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                             ),
                           ],
                         ),
                         const SizedBox(height: 12),
                         Text(
                           widget.post['caption'],
                           style: const TextStyle(fontSize: 15, color: Color(0xFF334155), height: 1.5),
                         ),
                         const SizedBox(height: 16),
                         Row(
                           children: [
                             const Icon(Icons.favorite_rounded, color: Colors.redAccent, size: 20),
                             const SizedBox(width: 6),
                             Text('${widget.post['likes']} likes', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                             const SizedBox(width: 20),
                             const Icon(Icons.access_time_rounded, color: Colors.grey, size: 20),
                              const SizedBox(width: 6),
                             const Text('2 hours ago', style: TextStyle(color: Colors.grey)),
                           ],
                         ),
                         const Divider(height: 40),
                         const Text(
                           'Comments',
                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                         ),
                         const SizedBox(height: 16),
                         // Comments List
                         ...comments.map((comment) => Padding(
                           padding: const EdgeInsets.only(bottom: 16.0),
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               CircleAvatar(
                                 backgroundColor: Colors.grey[200],
                                 radius: 16,
                                 child: Text(comment['user']![0], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                               ),
                               const SizedBox(width: 12),
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(comment['user']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                     const SizedBox(height: 2),
                                     Text(comment['text']!, style: const TextStyle(fontSize: 14)),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         )),
                       ],
                     ),
                   ),
                ],
              ),
            ),
          ),
          // Comment Input
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -4)),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      filled: true,
                      fillColor: const Color(0xFFF1F5F9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: addComment,
                  icon: const Icon(Icons.send_rounded, color: Color(0xFF6366F1)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
