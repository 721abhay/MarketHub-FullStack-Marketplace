import 'package:markethub/features/health/screens/doctor_consultation_screen.dart';
import 'package:markethub/features/health/screens/prescription_upload_screen.dart';
import 'package:flutter/material.dart';

class PharmacyHomeScreen extends StatelessWidget {
  static const String routeName = '/pharmacy-home';
  const PharmacyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F9FF), // Soft blue
      body: CustomScrollView(
        slivers: [
          _buildPharmacyAppBar(context),
          _buildQuickServices(context),
          _buildHealthBanner(),
          _buildSectionTitle('Popular Health Categories'),
          _buildHealthCategoryGrid(context),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildPharmacyAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      backgroundColor: const Color(0xFF0EA5E9),
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('MarketHub Pharmacy', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF0EA5E9), Color(0xFF38BDF8)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.description_outlined, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, PrescriptionUploadScreen.routeName),
        ),
      ],
    );
  }

  Widget _buildQuickServices(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            _buildServiceCard(context, Icons.upload_file, 'Upload Prescription', const Color(0xFF0EA5E9), () {
              Navigator.pushNamed(context, PrescriptionUploadScreen.routeName);
            }),
            const SizedBox(width: 16),
            _buildServiceCard(context, Icons.chat_bubble_outline, 'Consult Doctor', Colors.indigoAccent, () {
              Navigator.pushNamed(context, DoctorConsultationScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, IconData icon, String label, Color color, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: color.withValues(alpha: 0.1), blurRadius: 20, offset: const Offset(0, 10))]),
          child: Column(
            children: [
              Icon(icon, color: color, size: 30),
              const SizedBox(height: 12),
              Text(label, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHealthBanner() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: const Color(0xFF6366F1), borderRadius: BorderRadius.circular(24)),
        child: const Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Wellness Sale!', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Up to 50% Off on Vitamins & Supplements', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            Icon(Icons.health_and_safety, color: Colors.white, size: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
        child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildHealthCategoryGrid(BuildContext context) {
    final categories = ['Diabetes', 'Heart Care', 'Skin Care', 'Wellness', 'Pain Relief', 'Baby Care'];
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.8),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.medical_services_outlined, color: Colors.blue[300]),
                  const SizedBox(height: 8),
                  Text(categories[index], style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                ],
              ),
            );
          },
          childCount: categories.length,
        ),
      ),
    );
  }
}
