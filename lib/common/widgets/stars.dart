import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final double rating;
  const Stars({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: const Color.fromRGBO(255, 153, 0, 1),
          size: 20,
        );
      },
    );
  }
}
