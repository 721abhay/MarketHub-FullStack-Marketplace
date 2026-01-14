import 'package:flutter/material.dart';

class SupportBotScreen extends StatefulWidget {
  static const String routeName = '/support-bot';
  const SupportBotScreen({super.key});

  @override
  State<SupportBotScreen> createState() => _SupportBotScreenState();
}

class _SupportBotScreenState extends State<SupportBotScreen> {
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hello! I am your MarketHub Assistant. How can I help you today?', 'isMe': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('MarketHub Support Bot', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), Text('Always Active', style: TextStyle(fontSize: 12, color: Colors.greenAccent))]),
        backgroundColor: const Color(0xFF1E293B),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(child: _buildChatList()),
          _buildQuickReplies(),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final msg = _messages[index];
        return Align(
          alignment: msg['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
            decoration: BoxDecoration(
              color: msg['isMe'] ? const Color(0xFF6366F1) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)],
            ),
            child: Text(msg['text'], style: TextStyle(color: msg['isMe'] ? Colors.white : Colors.black87)),
          ),
        );
      },
    );
  }

  Widget _buildQuickReplies() {
    final replies = ['Order Status', 'Refund Policy', 'Talk to Human', 'Payment Failing'];
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: replies.length,
        itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => setState(() => _messages.add({'text': replies[index], 'isMe': true})),
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFE2E8F0))),
                child: Center(child: Text(replies[index], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF6366F1)))),
              ),
            );
        },
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(child: Container(padding: const EdgeInsets.symmetric(horizontal: 16), decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(12)), child: const TextField(decoration: InputDecoration(hintText: 'Type your issue...', border: InputBorder.none)))),
          const SizedBox(width: 12),
          CircleAvatar(backgroundColor: const Color(0xFF6366F1), child: const Icon(Icons.send, color: Colors.white, size: 20)),
        ],
      ),
    );
  }
}
