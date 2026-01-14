import 'package:flutter/material.dart';

class MyTicketsScreen extends StatelessWidget {
  static const String routeName = '/my-tickets';
  const MyTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(title: const Text('My Tickets'), backgroundColor: const Color(0xFFF43F5E), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
            child: Column(
              children: [
                _buildTicketHeader(),
                const Divider(height: 1, indent: 20, endIndent: 20),
                _buildTicketDetails(),
                _buildQrSection(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTicketHeader() {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage('https://images.unsplash.com/photo-1459749411177-042180ce673b?auto=format&fit=crop&q=80&w=200')),
          SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Cyber City Music Fest', style: TextStyle(fontWeight: FontWeight.bold)), Text('Confirmed', style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold))])),
        ],
      ),
    );
  }

  Widget _buildTicketDetails() {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _DetailBlock('DATE', '15 JAN 2026'),
          _DetailBlock('TIME', '06:00 PM'),
          _DetailBlock('SEATS', 'B12, B13'),
        ],
      ),
    );
  }

  Widget _buildQrSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.grey[50], borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24))),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.qr_code_2, size: 80, color: Colors.black87),
          SizedBox(width: 20),
          Text('Scan this QR at the venue\nfor entry.', style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}

class _DetailBlock extends StatelessWidget {
  final String label;
  final String val;
  const _DetailBlock(this.label, this.val);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, letterSpacing: 1)), const SizedBox(height: 4), Text(val, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12))]);
  }
}
