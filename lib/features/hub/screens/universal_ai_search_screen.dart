import 'dart:ui';
import 'package:flutter/material.dart';

class UniversalAISearchScreen extends StatefulWidget {
  static const String routeName = '/universal-ai-search';
  const UniversalAISearchScreen({super.key});

  @override
  State<UniversalAISearchScreen> createState() => _UniversalAISearchScreenState();
}

class _UniversalAISearchScreenState extends State<UniversalAISearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Stack(
        children: [
          // Animated Background Gradients
          Positioned(top: -100, right: -100, child: _CircularGradient(color: Colors.indigo.withValues(alpha: 0.3), size: 400)),
          Positioned(bottom: -50, left: -50, child: _CircularGradient(color: Colors.purple.withValues(alpha: 0.2), size: 300)),
          
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: _isSearching ? _buildSearchResults() : _buildSearchSuggestions(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white)),
              const Expanded(child: Center(child: Text('AI UNIFIED SEARCH', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 13)))),
              const SizedBox(width: 48),
            ],
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                ),
                child: TextField(
                  controller: _searchController,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  onChanged: (val) => setState(() => _isSearching = val.isNotEmpty),
                  decoration: InputDecoration(
                    hintText: 'Ask anything...',
                    hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.3)),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.mic_none_rounded, color: Colors.indigoAccent[100]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSuggestions() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const Text('SMART SUGGESTIONS', style: TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
        const SizedBox(height: 20),
        _suggestionTile(Icons.shopping_bag_rounded, 'Latest smartphones under \$500', 'Shopping'),
        _suggestionTile(Icons.flight_rounded, 'Cheap flights to Paris in June', 'Travel'),
        _suggestionTile(Icons.medical_services_rounded, 'Best supplements for energy', 'Pharmacy'),
        _suggestionTile(Icons.work_rounded, 'Remote Flutter jobs for seniors', 'Careers'),
        const SizedBox(height: 40),
        const Text('POPULAR IN HUB', style: TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: ['iPhone 15', 'Milk Subscription', 'Best Properties', 'Hotel Deals', 'Quiz Weekly', 'Tech News'].map((tag) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(tag, style: const TextStyle(color: Colors.white70, fontSize: 13)),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Container(
                height: 60, width: 60,
                decoration: BoxDecoration(color: Colors.indigo.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(16)),
                child: const Icon(Icons.auto_awesome_rounded, color: Colors.indigoAccent),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Global Result #${index + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    const Text('Found in Multiple Verticals', style: TextStyle(color: Colors.white38, fontSize: 12)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 14),
            ],
          ),
        );
      },
    );
  }

  Widget _suggestionTile(IconData icon, String title, String vertical) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          Icon(icon, color: Colors.white24, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 15)),
                Text(vertical, style: const TextStyle(color: Colors.indigoAccent, fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CircularGradient extends StatelessWidget {
  final Color color;
  final double size;
  const _CircularGradient({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
      ),
    );
  }
}
