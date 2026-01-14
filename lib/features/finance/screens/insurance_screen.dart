import 'package:amazon_clone/features/finance/screens/file_claim_screen.dart';
import 'package:flutter/material.dart';

class InsuranceCenterScreen extends StatelessWidget {
  static const String routeName = '/insurance-center';
  const InsuranceCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(title: const Text('Insurance & Protection'), backgroundColor: const Color(0xFF0F172A), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildActivePolicy(),
            const SizedBox(height: 32),
            _buildProtectionCategories(),
            const SizedBox(height: 32),
             _buildEmergencyAction(),
          ],
        ),
      ),
    );
  }

  Widget _buildActivePolicy() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.blue.withValues(alpha: 0.3))),
      child: const Column(
        children: [
          Row(children: [Icon(Icons.verified, color: Colors.blue), SizedBox(width: 12), Text('Device Care+', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))]),
          SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Coverage until:'), Text('12 Jan 2027', style: TextStyle(fontWeight: FontWeight.bold))]),
          Divider(height: 32),
          Text('Your iPhone 15 Pro is fully protected against accidental damage.', style: TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildProtectionCategories() {
    final cats = [
       {'name': 'Health', 'icon': Icons.favorite_outline},
       {'name': 'Gadgets', 'icon': Icons.smartphone},
       {'name': 'Travel', 'icon': Icons.flight_takeoff},
       {'name': 'Home', 'icon': Icons.home_outlined},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.5, mainAxisSpacing: 12, crossAxisSpacing: 12),
      itemCount: cats.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(cats[index]['icon'] as IconData, color: Colors.blueGrey), const SizedBox(height: 8), Text(cats[index]['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13))]),
        );
      },
    );
  }

  Widget _buildEmergencyAction() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, FileClaimScreen.routeName),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.red[50], borderRadius: BorderRadius.circular(24)),
        child: Row(children: [const Icon(Icons.emergency_share, color: Colors.red), const SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('File a Claim', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)), Text('Instant assistance for your active policies.', style: TextStyle(color: Colors.redAccent, fontSize: 11))])), const Icon(Icons.arrow_forward_ios, color: Colors.red, size: 14)]),
      ),
    );
  }
}
