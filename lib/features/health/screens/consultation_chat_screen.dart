import 'package:flutter/material.dart';

class ConsultationChatScreen extends StatefulWidget {
  static const String routeName = '/consultation-chat';
  final String doctorName;
  const ConsultationChatScreen({super.key, required this.doctorName});

  @override
  State<ConsultationChatScreen> createState() => _ConsultationChatScreenState();
}

class _ConsultationChatScreenState extends State<ConsultationChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hello! How can I help you today?', 'isMe': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(backgroundColor: Color(0xFF0EA5E9), child: Icon(Icons.person, color: Colors.white, size: 20)),
            const SizedBox(width: 12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(widget.doctorName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)), const Text('Online', style: TextStyle(fontSize: 10, color: Colors.green))]),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: msg['isMe'] ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: msg['isMe'] ? const Color(0xFF0EA5E9) : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(20),
                            topRight: const Radius.circular(20),
                            bottomLeft: Radius.circular(msg['isMe'] ? 20 : 0),
                            bottomRight: Radius.circular(msg['isMe'] ? 0 : 20),
                          ),
                        ),
                        child: Text(msg['text'], style: TextStyle(color: msg['isMe'] ? Colors.white : Colors.black87)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Expanded(child: Container(padding: const EdgeInsets.symmetric(horizontal: 20), decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(30)), child: TextField(controller: _messageController, decoration: const InputDecoration(hintText: 'Type your message...', border: InputBorder.none, hintStyle: TextStyle(fontSize: 14))))),
          const SizedBox(width: 12),
          GestureDetector(onTap: () { if (_messageController.text.isNotEmpty) { setState(() { _messages.add({'text': _messageController.text, 'isMe': true}); _messageController.clear(); }); } }, child: const CircleAvatar(backgroundColor: Color(0xFF0EA5E9), child: Icon(Icons.send_rounded, color: Colors.white, size: 20))),
        ],
      ),
    );
  }
}
