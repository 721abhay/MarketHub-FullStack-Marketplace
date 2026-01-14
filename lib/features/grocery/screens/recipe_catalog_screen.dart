import 'package:flutter/material.dart';

class RecipeCatalogScreen extends StatelessWidget {
  static const String routeName = '/recipe-catalog';
  const RecipeCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Cook with Fresh', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF16A34A),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('What are you cooking today?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildSearchBox(),
            const SizedBox(height: 32),
            _buildRecipeCard(
              'Summer Avocado Toast',
              'Quick & Healthy Breakfast',
              '15 mins',
              'https://images.unsplash.com/photo-1525351484163-7529414344d8?auto=format&fit=crop&q=80&w=600',
            ),
            const SizedBox(height: 20),
            _buildRecipeCard(
              'Mushroom Risotto',
              'Gourmet Comfort Food',
              '45 mins',
              'https://images.unsplash.com/photo-1476124369491-e7addf5db371?auto=format&fit=crop&q=80&w=600',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
      child: const TextField(
        decoration: InputDecoration(hintText: 'Search for recipes (Pasta, Salads...)', prefixIcon: Icon(Icons.search, color: Color(0xFF16A34A)), border: InputBorder.none, contentPadding: EdgeInsets.all(16)),
      ),
    );
  }

  Widget _buildRecipeCard(String title, String subtitle, String time, String image) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Image.network(image, height: 200, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(children: [const Icon(Icons.access_time, size: 16, color: Colors.grey), const SizedBox(width: 4), Text(time, style: const TextStyle(color: Colors.grey, fontSize: 13))]),
                  ],
                ),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF16A34A), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    child: const Text('View Recipe & Get Ingredients'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
