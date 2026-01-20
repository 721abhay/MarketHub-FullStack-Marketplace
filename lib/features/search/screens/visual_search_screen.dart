import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:markethub/features/search/services/visual_search_services.dart';
import 'package:markethub/models/product.dart';
import 'package:markethub/common/widgets/loader.dart';
import 'package:markethub/features/product_details/screens/product_details_screen.dart';

class VisualSearchScreen extends StatefulWidget {
  static const String routeName = '/visual-search';
  const VisualSearchScreen({super.key});

  @override
  State<VisualSearchScreen> createState() => _VisualSearchScreenState();
}

class _VisualSearchScreenState extends State<VisualSearchScreen> {
  final VisualSearchServices visualSearchServices = VisualSearchServices();
  List<Product>? searchResults;
  bool isSearching = false;
  File? selectedImage;

  void pickImage() async {
    var res = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (res != null && res.files.isNotEmpty) {
      setState(() {
        selectedImage = File(res.files.first.path!);
        isSearching = true;
      });
      fetchResults();
    }
  }

  void fetchResults() async {
    if (selectedImage != null) {
      searchResults = await visualSearchServices.searchByImage(
        context: context,
        image: selectedImage!,
      );
      setState(() {
        isSearching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background - Image or Mock Camera
          selectedImage != null
              ? Positioned.fill(
                  child: Image.file(selectedImage!, fit: BoxFit.cover))
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white10,
                  child: const Center(
                      child: Icon(Icons.camera_alt_outlined,
                          color: Colors.white38, size: 80)),
                ),

          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                const Spacer(),
                if (isSearching)
                  const Center(child: Loader())
                else if (searchResults != null)
                  _buildResultsList()
                else
                  _buildEmptyState(),
                const SizedBox(height: 32),
                _buildControls(),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context)),
          const Text('Visual Search',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          IconButton(
              icon: const Icon(Icons.flash_off, color: Colors.white),
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Text('Point your camera at a product or upload from gallery',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70, fontSize: 14)),
    );
  }

  Widget _buildResultsList() {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: searchResults!.length,
        itemBuilder: (context, index) {
          final product = searchResults![index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, ProductDetailScreen.routeName,
                arguments: product),
            child: Container(
              width: 140,
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.network(product.images[0], fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _searchOption(Icons.photo_library_outlined, 'Gallery', pickImage),
        const SizedBox(width: 48),
        GestureDetector(
          onTap: pickImage, // Using picker for now to simulate camera
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4)),
            child: const CircleAvatar(radius: 35, backgroundColor: Colors.white),
          ),
        ),
        const SizedBox(width: 48),
        _searchOption(Icons.history, 'History', () {}),
      ],
    );
  }

  Widget _searchOption(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
