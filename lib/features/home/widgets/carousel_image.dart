import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/constants/global_variables.dart';

class CarouselImage extends StatefulWidget {
  const CarouselImage({super.key});

  @override
  State<CarouselImage> createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: GlobalVariables.carouselImages.map(
            (i) {
              return Builder(
                builder: (BuildContext context) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      i,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.image_not_supported, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            height: 220,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: GlobalVariables.carouselImages.asMap().entries.map((entry) {
            return Container(
              width: _current == entry.key ? 18.0 : 6.0,
              height: 6.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: _current == entry.key
                    ? const Color(0xFF6366F1)
                    : const Color(0xFFE2E8F0),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
