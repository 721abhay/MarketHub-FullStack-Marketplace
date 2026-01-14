import 'package:flutter/material.dart';

class TaxInvoiceScreen extends StatelessWidget {
  static const String routeName = '/tax-invoices';
  const TaxInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('Tax Invoices'), backgroundColor: const Color(0xFF334155), foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey[200]!)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('INV-2026-0$index', style: const TextStyle(fontWeight: FontWeight.bold)), Text('12 Jan 2026', style: const TextStyle(color: Colors.grey, fontSize: 12))]),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(8)), child: const Text('PAID', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 10))),
                  ],
                ),
                const Divider(height: 32),
                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Total Amount', style: TextStyle(color: Colors.grey)), Text('\$1,450.00', style: TextStyle(fontWeight: FontWeight.bold))]),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.download), label: const Text('Download PDF'), style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))))),
                    const SizedBox(width: 12),
                    Expanded(child: ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.email_outlined), label: const Text('Email'), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF334155), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))))),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
