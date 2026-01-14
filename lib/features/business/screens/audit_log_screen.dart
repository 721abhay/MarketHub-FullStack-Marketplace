import 'package:flutter/material.dart';

class EnterpriseAuditLog extends StatelessWidget {
  static const String routeName = '/audit-log';
  const EnterpriseAuditLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Activity Audit Log'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.history_toggle_off, color: Colors.blueAccent),
            title: const Text('Staff Permission Changed', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            subtitle: const Text('by Admin John • 12 Jan 2026, 12:40 PM', style: TextStyle(fontSize: 12)),
            trailing: const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          );
        },
      ),
    );
  }
}
