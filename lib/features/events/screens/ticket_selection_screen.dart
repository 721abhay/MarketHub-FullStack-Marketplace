import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/features/events/screens/booking_confirmation_screen.dart';
import 'package:flutter/material.dart';

class TicketSelectionScreen extends StatefulWidget {
  static const String routeName = '/ticket-selection';
  final Map<String, dynamic> event;
  const TicketSelectionScreen({super.key, required this.event});

  @override
  State<TicketSelectionScreen> createState() => _TicketSelectionScreenState();
}

class _TicketSelectionScreenState extends State<TicketSelectionScreen> {
  int _ticketCount = 1;
  String _selectedCategory = 'Silver';

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Silver', 'price': 49, 'desc': 'Standard Entry, Standing', 'color': Colors.grey},
    {'name': 'Gold', 'price': 99, 'desc': 'Seated, Mid-row', 'color': Colors.amber},
    {'name': 'Platinum', 'price': 199, 'desc': 'Front row, VIP Lounge', 'color': Colors.blueGrey},
  ];

  @override
  Widget build(BuildContext context) {
    int price = _categories.firstWhere((cat) => cat['name'] == _selectedCategory)['price'];
    int total = price * _ticketCount;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Select Tickets', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const Text('Choose Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                ..._categories.map((cat) => _buildCategoryCard(cat)),
                const SizedBox(height: 32),
                const Text('Select Quantity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                _buildQuantitySelector(),
              ],
            ),
          ),
          _buildBottomSummary(total),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> cat) {
    bool isSelected = _selectedCategory == cat['name'];
    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = cat['name']),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: isSelected ? const Color(0xFFF43F5E) : Colors.transparent, width: 2),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
        ),
        child: Row(
          children: [
            Container(width: 4, height: 40, decoration: BoxDecoration(color: cat['color'], borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cat['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(cat['desc'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            Text('\$${cat['price']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFFF43F5E))),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Number of Tickets', style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              _counterBtn(Icons.remove, () { if (_ticketCount > 1) setState(() => _ticketCount--); }),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text('$_ticketCount', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              _counterBtn(Icons.add, () => setState(() => _ticketCount++)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _counterBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(10)), child: Icon(icon, size: 20)),
    );
  }

  Widget _buildBottomSummary(int total) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Amount', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                Text('\$$total', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFF43F5E))),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(onTap: () => Navigator.pushNamed(context, BookingConfirmationScreen.routeName, arguments: {'total': total, 'event': widget.event['title']}), text: 'Pay Now'),
          ],
        ),
      ),
    );
  }
}
