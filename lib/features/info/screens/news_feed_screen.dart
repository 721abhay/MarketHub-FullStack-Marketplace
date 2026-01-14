import 'package:flutter/material.dart';

class NewsFeedScreen extends StatelessWidget {
  static const String routeName = '/news-feed';
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('MarketHub News'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network('https://images.unsplash.com/photo-1504711434969-e33886168f5c?auto=format&fit=crop&q=80&w=200', height: 100, width: 100, fit: BoxFit.cover)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('TECH', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 11)),
                      const Text('The Future of Super-Apps in 2026', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, height: 1.2)),
                      const SizedBox(height: 8),
                      Text('Discover how platforms are evolving into unified digital ecosystems...', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                      const SizedBox(height: 8),
                      const Text('4 mins read • 2 hours ago', style: TextStyle(color: Colors.grey, fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
