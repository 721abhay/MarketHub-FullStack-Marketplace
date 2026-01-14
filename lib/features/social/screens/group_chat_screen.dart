import 'package:flutter/material.dart';

class GroupChatScreen extends StatelessWidget {
  static const String routeName = '/group-chat';
  const GroupChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Design Enthusiasts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), Text('42 members online', style: TextStyle(fontSize: 11))]),
        backgroundColor: const Color(0xFF1E293B),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(padding: const EdgeInsets.all(20), itemCount: 10, itemBuilder: (context, index) => _buildMessage(index))),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessage(int index) {
    bool isMe = index % 3 == 0;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(color: isMe ? const Color(0xFF6366F1) : Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)]),
        child: Text('This is a simulated group message in the community.', style: TextStyle(color: isMe ? Colors.white : Colors.black87)),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Icon(Icons.add_circle_outline, color: Colors.grey),
          const SizedBox(width: 16),
          Expanded(child: Container(padding: const EdgeInsets.symmetric(horizontal: 16), decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(12)), child: const TextField(decoration: InputDecoration(hintText: 'Message group...', border: InputBorder.none)))),
          const SizedBox(width: 16),
          const CircleAvatar(backgroundColor: Color(0xFF6366F1), child: Icon(Icons.send, color: Colors.white, size: 20)),
        ],
      ),
    );
  }
}
