import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatelessWidget {
  static const String routeName = '/recipe-details';
  const RecipeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://images.unsplash.com/photo-1525351484163-7529414344d8?auto=format&fit=crop&q=80&w=800',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Summer Avocado Toast', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Healthy | 15 Mins | 2 Servings', style: TextStyle(color: Colors.grey)),
                  const Divider(height: 48),
                  const Text('Ingredients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildIngredientItem('Whole Grain Bread', '2 Slices'),
                  _buildIngredientItem('Ripe Avocado', '1 Unit'),
                  _buildIngredientItem('Cherry Tomatoes', '100g'),
                  _buildIngredientItem('Extra Virgin Olive Oil', '1 Tbsp'),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined),
                      label: const Text('Add All Ingredients to Cart', style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF16A34A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text('Method', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  const Text(
                    '1. Toast the bread until golden brown.\n2. Mash the avocado in a bowl with a pinch of salt.\n3. Spread the avocado over the toast.\n4. Top with halved cherry tomatoes and a drizzle of olive oil.',
                    style: TextStyle(height: 1.8, fontSize: 15),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientItem(String name, String qty) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.check_circle_outline, color: Color(0xFF16A34A), size: 20),
              const SizedBox(width: 12),
              Text(name, style: const TextStyle(fontSize: 16)),
            ],
          ),
          Text(qty, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
