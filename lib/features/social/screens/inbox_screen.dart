import 'package:flutter/material.dart';

class MessagingInboxScreen extends StatelessWidget {
  static const String routeName = '/inbox';
  const MessagingInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Messages'), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            leading: const CircleAvatar(radius: 28, backgroundImage: NetworkImage('https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&q=80&w=200')),
            title: const Text('Sarah Miller', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Hey, is the offer still available?', maxLines: 1, overflow: TextOverflow.ellipsis),
            trailing: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('2:40 PM', style: TextStyle(color: Colors.grey, fontSize: 11)), SizedBox(height: 4), CircleAvatar(radius: 8, backgroundColor: Colors.blue, child: Text('1', style: TextStyle(color: Colors.white, fontSize: 8)))]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, backgroundColor: Colors.blue, child: const Icon(Icons.edit, color: Colors.white)),
    );
  }
}
