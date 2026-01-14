import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/models/order.dart';
import 'package:flutter/material.dart';

class ReturnRequestScreen extends StatefulWidget {
  static const String routeName = '/return-request';
  final Order order;
  const ReturnRequestScreen({super.key, required this.order});

  @override
  State<ReturnRequestScreen> createState() => _ReturnRequestScreenState();
}

class _ReturnRequestScreenState extends State<ReturnRequestScreen> {
  String? _selectedReason;
  final TextEditingController _commentsController = TextEditingController();
  
  final List<String> _reasons = [
    'Defective or broken',
    'Item does not match description',
    'Missing parts or accessories',
    'Arrived too late',
    'Quality not as expected',
    'Wrong item sent',
  ];

  @override
  void dispose() {
    _commentsController.dispose();
    super.dispose();
  }

  void submitReturn() {
    if (_selectedReason == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a reason for return')),
      );
      return;
    }
    // Mock API call
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Return Request Submitted Successfully!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Request Return',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                children: [
                   ClipRRect(
                     borderRadius: BorderRadius.circular(8),
                     child: Image.network(
                       widget.order.products[0].images[0],
                       height: 60,
                       width: 60,
                       fit: BoxFit.cover,
                     ),
                   ),
                   const SizedBox(width: 16),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Order #${widget.order.id.substring(widget.order.id.length - 8).toUpperCase()}',
                           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF6366F1)),
                         ),
                         Text(
                           widget.order.products[0].name,
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                           style: const TextStyle(fontWeight: FontWeight.w600),
                         ),
                       ],
                     ),
                   ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Why are you returning this?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedReason,
                  hint: const Text('Select a reason'),
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down_circle_outlined, color: Color(0xFF6366F1)),
                  items: _reasons.map((String reason) {
                    return DropdownMenuItem<String>(
                      value: reason,
                      child: Text(reason),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedReason = newValue;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 32),
             const Text(
              'Additional Comments',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _commentsController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Describe the issue in detail...',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 48),
            CustomButton(
              text: 'Submit Request',
              onTap: submitReturn,
              color: GlobalVariables.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
