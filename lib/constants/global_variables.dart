import 'package:flutter/material.dart';

class GlobalVariables {
  // Replace with your IP address
  static const String uri = 'http://192.168.0.103:3000';
  
  // COLORS - MarketHub Modern Premium Palette
  static const appBarGradient = LinearGradient(
    colors: [
      Color(0xFF6366F1), // Royal Indigo
      Color(0xFFA855F7), // Purple
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const secondaryColor = Color(0xFF10B981); // Emerald
  static const accentColor = Color(0xFFF59E0B); // Amber for CTA
  static const backgroundColor = Color(0xFFF8FAFC);
  static const Color greyBackgroundCOlor = Color(0xfff1f5f9); // Slate 100
  static const Color selectedNavBarColor = Color(0xFF6366F1);
  static const unselectedNavBarColor = Color(0xFF94A3B8); // Slate 400

  // Glassmorphism System
  static BoxDecoration glassmorphicDecoration = BoxDecoration(
    color: Colors.white.withValues(alpha: 0.7),
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: Colors.white, width: 1.5),
    boxShadow: [
      BoxShadow(
        color: Color(0xFF6366F1).withValues(alpha: 0.1),
        blurRadius: 30,
        offset: const Offset(0, 10),
      ),
    ],
  );

  static Color glassColor = Colors.white.withValues(alpha: 0.15);
  static double glassBlur = 15.0;

  // STATIC IMAGES
  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=200&auto=format&fit=crop',
    },
    {
      'title': 'Grocery',
      'image': 'https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=200&auto=format&fit=crop',
    },
    {
      'title': 'Milk Sub',
      'image': 'https://images.unsplash.com/photo-1528498033373-3c6c08e93d79?q=80&w=200&auto=format&fit=crop',
    },
    {
      'title': 'Coupons',
      'image': 'https://images.unsplash.com/photo-1553531384-cc64ac80f931?q=80&w=200&auto=format&fit=crop',
    },
    {
      'title': 'Market Hub',
      'image': 'https://images.unsplash.com/photo-1557804506-669a67965ba0?q=80&w=200&auto=format&fit=crop',
    },
    {
      'title': 'Deals',
      'image': 'https://images.unsplash.com/photo-1607082349566-187342175e2f?q=80&w=200&auto=format&fit=crop',
    },
    {
      'title': 'Appliances',
      'image': 'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?q=80&w=200&auto=format&fit=crop',
    },
    {
      'title': 'Books',
      'image': 'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?q=80&w=200&auto=format&fit=crop',
    },
    {
      'title': 'Fashion',
      'image': 'https://images.unsplash.com/photo-1483985988355-763728e1935b?q=80&w=200&auto=format&fit=crop',
    },
  ];

  static const List<String> carouselImages = [
    'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?q=80&w=1200&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1607083206968-13611e3d76db?q=80&w=1200&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1544117518-3390c996831d?q=80&w=1200&auto=format&fit=crop',
    'https://images.unsplash.com/photo-1441986300917-64674bd600d8?q=80&w=1200&auto=format&fit=crop',
  ];
}
