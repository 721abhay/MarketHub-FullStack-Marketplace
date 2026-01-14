import 'package:flutter/material.dart';

class BusinessHomeScreen extends StatelessWidget {
  static const String routeName = '/business-home';
  const BusinessHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text('MarketHub Business', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF334155),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBusinessStats(),
            const SizedBox(height: 32),
            _buildSectionHeader('Enterprise Tools'),
            const SizedBox(height: 16),
            _buildToolGrid(context),
            const SizedBox(height: 32),
            _buildSectionHeader('Exclusive Business Deals'),
            _buildBusinessProduct(),
          ],
        ),
      ),
    );
  }

  Widget _buildBusinessStats() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xFF334155), borderRadius: BorderRadius.circular(24)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _StatItem('Pending Quotes', '04'),
          _StatItem('Bulk Samples', '02'),
          _StatItem('Unpaid Invoices', '\$2,450'),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }

  Widget _buildToolGrid(BuildContext context) {
    final tools = [
       {'name': 'Get Bulk Quote', 'icon': Icons.request_page, 'color': Colors.blue},
       {'name': 'Invoices', 'icon': Icons.receipt, 'color': Colors.indigo},
       {'name': 'Staff Access', 'icon': Icons.group, 'color': Colors.orange},
       {'name': 'GST Central', 'icon': Icons.verified_user, 'color': Colors.teal},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.5, mainAxisSpacing: 12, crossAxisSpacing: 12),
      itemCount: tools.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(tools[index]['icon'] as IconData, color: tools[index]['color'] as Color),
              const SizedBox(height: 8),
              Text(tools[index]['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBusinessProduct() {
     return Container(
       margin: const EdgeInsets.only(top: 16),
       padding: const EdgeInsets.all(16),
       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
       child: Column(
         children: [
           Image.network('https://images.unsplash.com/photo-1593642702821-c8da6771f0c6?auto=format&fit=crop&q=80&w=400', height: 150),
           const Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Enterprise Laptop Bulk (X10)', style: TextStyle(fontWeight: FontWeight.bold)), Text('Save \$1,200 with Business Price', style: TextStyle(color: Colors.green, fontSize: 12))]),
               Text('\$8,999', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
             ],
           ),
         ],
       ),
     );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String val;
  const _StatItem(this.label, this.val);

  @override
  Widget build(BuildContext context) {
     return Column(
       children: [
         Text(val, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
         Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
       ],
     );
  }
}
