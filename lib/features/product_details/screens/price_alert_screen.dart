import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class PriceAlertScreen extends StatefulWidget {
  static const String routeName = '/price-alert';
  final Product product;
  const PriceAlertScreen({super.key, required this.product});

  @override
  State<PriceAlertScreen> createState() => _PriceAlertScreenState();
}

class _PriceAlertScreenState extends State<PriceAlertScreen> {
  final TextEditingController _priceController = TextEditingController();
  bool _emailNotify = true;
  bool _pushNotify = true;

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  void createAlert() {
    if (_priceController.text.isEmpty) return;
    
    // Mock API Call
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Alert set for \$${_priceController.text}')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Set Price Alert',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.product.images[0],
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Current Price: \$${widget.product.price}',
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 48),
            
            const Text(
              'Alert me when price drops below:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: _priceController,
              hintText: 'Enter Target Price (e.g. ${widget.product.price - 10})',
            ),
            
            const SizedBox(height: 32),
            const Text(
              'Notification Channels',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              value: _pushNotify,
              activeThumbColor: GlobalVariables.secondaryColor,
              onChanged: (val) => setState(() => _pushNotify = val),
              title: const Text('Push Notification'),
              secondary: const Icon(Icons.notifications_active_outlined),
            ),
            SwitchListTile(
              value: _emailNotify,
              activeThumbColor: GlobalVariables.secondaryColor,
              onChanged: (val) => setState(() => _emailNotify = val),
              title: const Text('Email Alert'),
              secondary: const Icon(Icons.email_outlined),
            ),

            const SizedBox(height: 48),
            CustomButton(text: 'Create Alert', onTap: createAlert),
          ],
        ),
      ),
    );
  }
}
