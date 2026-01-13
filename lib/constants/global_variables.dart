import 'package:flutter/material.dart';

class GlobalVariables {
  // Replace with your IP address
  static const String uri = 'http://192.168.0.103:3000';
  // COLORS - MarketHub Premium Palette
  static const appBarGradient = LinearGradient(
    colors: [
      Color(0xFF6366F1), // Indigo
      Color(0xFF8B5CF6), // Violet
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color(0xFF06B6D4); // Cyan
  static const accentColor = Color(0xFFF59E0B); // Amber for CTA
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xfff8fafc); // Slate 50
  static var selectedNavBarColor = const Color(0xFF6366F1);
  static const unselectedNavBarColor = Color(0xFF64748B); // Slate 500

  // Phase 4: Glassmorphism Tokens
  static BoxDecoration glassmorphicDecoration = BoxDecoration(
    color: Colors.white.withOpacity(0.4),
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: Colors.white.withOpacity(0.4), width: 1.5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 20,
        offset: const Offset(0, 10),
      ),
    ],
  );

  static Color glassColor = Colors.white.withOpacity(0.2);
  static double glassBlur = 10.0;

  // STATIC IMAGES
  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=200&auto=format&fit=crop',
    },
    {
      'title': 'Essentials',
      'image': 'https://images.unsplash.com/photo-1583947215259-38e31be8751f?q=80&w=200&auto=format&fit=crop',
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
