import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class BulkRFQScreen extends StatefulWidget {
  static const String routeName = '/bulk-rfq';
  const BulkRFQScreen({super.key});

  @override
  State<BulkRFQScreen> createState() => _BulkRFQScreenState();
}

class _BulkRFQScreenState extends State<BulkRFQScreen> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Request Bulk Quote'), backgroundColor: const Color(0xFF334155), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Looking to Buy in Bulk?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Submit your requirements and our specialized sellers will send you the best quotes within 24 hours.', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 40),
            const Text('Item Name', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            CustomTextField(controller: _itemController, hintText: 'What are you looking for? (e.g. 100 Office Chairs)'),
            const SizedBox(height: 24),
            const Text('Minimum Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            CustomTextField(controller: _qtyController, hintText: 'Enter Qty (Min 50)'),
            const SizedBox(height: 24),
            const Text('Special Instructions', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            CustomTextField(controller: _notesController, hintText: 'Color preferences, delivery date, etc.', maxLines: 5),
            const SizedBox(height: 40),
            CustomButton(text: 'Submit Quote Request', onTap: () {}),
            const SizedBox(height: 20),
            const Center(child: Text('Safe and Secured B2B Transaction', style: TextStyle(color: Colors.grey, fontSize: 11))),
          ],
        ),
      ),
    );
  }
}
