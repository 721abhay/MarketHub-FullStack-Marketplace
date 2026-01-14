import 'package:flutter/material.dart';

class DesignerLookbookScreen extends StatelessWidget {
  static const String routeName = '/designer-lookbook';
  const DesignerLookbookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('EDITORIAL', style: TextStyle(letterSpacing: 4, fontWeight: FontWeight.w300)), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned.fill(child: Image.network('https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&q=80&w=800', fit: BoxFit.cover)),
              Positioned(
                bottom: 80,
                left: 40,
                right: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('01 / LOOKBOOK', style: TextStyle(color: Colors.white, letterSpacing: 2, fontSize: 12)),
                    const SizedBox(height: 12),
                    const Text('The Art of\nMinimalism', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold, height: 1.1)),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)), padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16)),
                      child: const Text('SHOP THE LOOK', style: TextStyle(letterSpacing: 2, fontSize: 12)),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
