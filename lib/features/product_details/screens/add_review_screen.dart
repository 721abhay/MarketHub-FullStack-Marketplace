import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Need to add this package

class AddReviewScreen extends StatefulWidget {
  static const String routeName = '/add-review';
  final Product product;
  const AddReviewScreen({super.key, required this.product});

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController _reviewController = TextEditingController();
  double rating = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void submitReview() {
    if (_formKey.currentState!.validate()) {
      // Mock Submission - Requires Backend API /api/rate-product update to accept text
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Review Submitted Successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Write a Review',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                 children: [
                   ClipRRect(
                     borderRadius: BorderRadius.circular(8),
                     child: Image.network(
                       widget.product.images[0],
                       height: 60,
                       width: 60,
                       fit: BoxFit.cover,
                     ),
                   ),
                   const SizedBox(width: 12),
                   Expanded(
                     child: Text(
                       widget.product.name,
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                     ),
                   ),
                 ],
               ),
               const SizedBox(height: 24),
              const Text(
                'Rate this product',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              // Star Rating Bar
              Center(
                child: RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rat) {
                    setState(() {
                      rating = rat;
                    });
                  },
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Write your review',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: _reviewController,
                hintText: 'What did you like or dislike? How was the quality?',
                maxLines: 5,
              ),
              const SizedBox(height: 32),
              const Text(
                'Add Photos (Optional)',
                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              // Mock Image Uploader
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[400]!),
                ),
                child: Center(
                  child: Icon(Icons.add_a_photo_outlined, color: Colors.grey[600], size: 30),
                ),
              ),
              const SizedBox(height: 48),
              CustomButton(
                text: 'Submit Review',
                onTap: submitReview,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
