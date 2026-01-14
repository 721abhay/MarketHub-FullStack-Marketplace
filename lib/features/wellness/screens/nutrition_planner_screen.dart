import 'package:flutter/material.dart';

class NutritionalPlannerScreen extends StatelessWidget {
  static const String routeName = '/nutrition-planner';
  const NutritionalPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('My Nutrition'), backgroundColor: const Color(0xFF10B981), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildCalorieCounter(),
            const SizedBox(height: 32),
            _buildMealPlan(),
          ],
        ),
      ),
    );
  }

  Widget _buildCalorieCounter() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(color: const Color(0xFFECFDF5), borderRadius: BorderRadius.circular(32)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _macroItem('Carbs', '45%', Colors.green),
          Column(children: [const Text('Remaining', style: TextStyle(color: Colors.grey, fontSize: 13)), const Text('1,240', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF065F46))), const Text('kcal', style: TextStyle(color: Colors.grey))]),
          _macroItem('Protein', '30%', Colors.orange),
        ],
      ),
    );
  }

  Widget _macroItem(String label, String pct, Color color) {
    return Column(children: [Text(pct, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)), Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11))]);
  }

  Widget _buildMealPlan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Today\'s Meal Plan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _mealRow('Breakfast', 'Avocado Toast & Eggs', '08:30 AM'),
        _mealRow('Lunch', 'Quinoa Salad', '01:00 PM'),
        _mealRow('Dinner', 'Grilled Salmon', '07:30 PM'),
      ],
    );
  }

  Widget _mealRow(String type, String name, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(type, style: const TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)), Text(name, style: const TextStyle(fontWeight: FontWeight.bold))]),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
