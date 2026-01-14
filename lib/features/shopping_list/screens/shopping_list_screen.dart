import 'package:flutter/material.dart';

class ShoppingListScreen extends StatefulWidget {
  static const String routeName = '/shopping-list';
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final List<Map<String, dynamic>> _items = [
    {'name': 'Fresh Milk', 'completed': false, 'category': 'Dairy'},
    {'name': 'Whole Wheat Bread', 'completed': true, 'category': 'Bakery'},
    {'name': 'Organic Tomatoes', 'completed': false, 'category': 'Vegetables'},
    {'name': 'Greek Yogurt', 'completed': false, 'category': 'Dairy'},
  ];

  final TextEditingController _itemController = TextEditingController();

  void _addItem() {
    if (_itemController.text.isNotEmpty) {
      setState(() {
        _items.add({'name': _itemController.text, 'completed': false, 'category': 'General'});
        _itemController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6366F1),
        foregroundColor: Colors.white,
        title: const Text('My Shopping List', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildInputSection(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return _buildListItem(index);
              },
            ),
          ),
          _buildActionFooter(),
        ],
      ),
    );
  }

  Widget _buildInputSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color(0xFF6366F1),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: TextField(
                controller: _itemController,
                decoration: const InputDecoration(border: InputBorder.none, hintText: 'Add an item...', hintStyle: TextStyle(fontSize: 14)),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _addItem,
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.add_rounded, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(int index) {
    final item = _items[index];
    return Dismissible(
      key: Key(item['name'] + index.toString()),
      onDismissed: (direction) {
        setState(() {
          _items.removeAt(index);
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))]),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  item['completed'] = !item['completed'];
                });
              },
              child: Icon(
                item['completed'] ? Icons.check_circle_rounded : Icons.radio_button_off_rounded,
                color: item['completed'] ? const Color(0xFF6366F1) : Colors.grey[300],
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      decoration: item['completed'] ? TextDecoration.lineThrough : null,
                      color: item['completed'] ? Colors.grey : const Color(0xFF1E293B),
                    ),
                  ),
                  Text(item['category'], style: TextStyle(fontSize: 11, color: Colors.grey[400])),
                ],
              ),
            ),
            Icon(Icons.more_vert_rounded, color: Colors.grey[300], size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildActionFooter() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -4))]),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_rounded),
              label: const Text('Move all to Cart'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                minimumSize: const Size(0, 50),
              ),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_rounded, color: Color(0xFF6366F1)),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFFE0E7FF),
              padding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }
}
