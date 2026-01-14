import 'package:markethub/models/product.dart';
import 'package:flutter/material.dart';

class AugmentedRealityScreen extends StatelessWidget {
  static const String routeName = '/ar-view';
  final Product product;
  const AugmentedRealityScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Mock Camera View (Background)
          Image.network(
            'https://images.unsplash.com/photo-1556910103-1c02745a30bf?auto=format&fit=crop&w=1600&q=80', // Living Room
            fit: BoxFit.cover,
          ),
          
          // AR Overlay (Product)
          Center(
            child: Draggable(
              feedback: Image.network(product.images[0], width: 200),
              childWhenDragging: Container(),
              child: Image.network(product.images[0], width: 250),
            ),
          ),
          
          // UI Overlays
          Positioned(
            top: 50,
            left: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              mini: true,
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: Colors.black),
            ),
          ),
          
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Drag to place product',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
