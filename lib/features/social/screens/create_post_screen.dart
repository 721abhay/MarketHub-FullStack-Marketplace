import 'package:markethub/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  static const String routeName = '/create-post';
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _captionController = TextEditingController();

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  void sharePost() {
    // Mock Share Logic
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post Shared Successfully!')),
    );
     Navigator.pop(context);
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
            'Create New Post',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: sharePost,
              child: const Text('Share', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                   backgroundColor: Color(0xFFF1F5F9),
                   radius: 24,
                   child: Icon(Icons.person, color: Colors.grey),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _captionController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: 'What\'s on your mind?',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                   height: 60,
                   width: 60,
                   decoration: BoxDecoration(
                     color: const Color(0xFFF8FAFC),
                     borderRadius: BorderRadius.circular(8),
                   ),
                   child: const Icon(Icons.add_photo_alternate_outlined, color: Colors.grey),
                ),
              ],
            ),
            const Divider(height: 40),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined, color: Color(0xFF6366F1)),
              title: const Text('Photo/Video'),
              onTap: () {},
            ),
             ListTile(
              leading: const Icon(Icons.local_offer_outlined, color: Color(0xFFF59E0B)),
              title: const Text('Tag Products'),
              onTap: () {},
            ),
             ListTile(
              leading: const Icon(Icons.location_on_outlined, color: Color(0xFFEF4444)),
              title: const Text('Add Location'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
