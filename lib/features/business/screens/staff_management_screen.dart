import 'package:flutter/material.dart';

class StaffManagementScreen extends StatelessWidget {
  static const String routeName = '/staff-management';
  const StaffManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(title: const Text('Staff Management'), backgroundColor: const Color(0xFF334155), foregroundColor: Colors.white),
      body: Column(
        children: [
          _buildInviteHeader(),
          Expanded(child: _buildStaffList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}, backgroundColor: const Color(0xFF334155), child: const Icon(Icons.person_add, color: Colors.white)),
    );
  }

  Widget _buildInviteHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Manage Team Access', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Invite employees to purchase and view invoices on behalf of the company.', style: TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(16)),
            child: const Row(children: [Icon(Icons.shield_outlined, color: Colors.blue), SizedBox(width: 12), Expanded(child: Text('Only Admins can approve orders over \$500.', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)))]),
          ),
        ],
      ),
    );
  }

  Widget _buildStaffList() {
    final staff = [
      {'name': 'Abhay Manager', 'role': 'Admin', 'status': 'Active'},
      {'name': 'Rahul Logistics', 'role': 'Purchaser', 'status': 'Active'},
      {'name': 'Sneha Accounts', 'role': 'Finance', 'status': 'Disabled'},
    ];
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: staff.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)]),
          child: Row(
            children: [
              CircleAvatar(backgroundColor: Colors.grey[200], child: Text(staff[index]['name']![0])),
              const SizedBox(width: 16),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(staff[index]['name']!, style: const TextStyle(fontWeight: FontWeight.bold)), Text(staff[index]['role']!, style: TextStyle(color: Colors.grey[600], fontSize: 12))])),
              Text(staff[index]['status']!, style: TextStyle(color: staff[index]['status'] == 'Active' ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 12)),
              const SizedBox(width: 8),
              const Icon(Icons.more_vert, size: 20, color: Colors.grey),
            ],
          ),
        );
      },
    );
  }
}
