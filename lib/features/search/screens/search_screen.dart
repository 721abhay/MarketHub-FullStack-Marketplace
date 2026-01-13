import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:amazon_clone/features/search/widgets/searched_product.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({
    super.key,
    required this.searchQuery,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();
  String _selectedSort = '';

  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  void fetchSearchedProduct() async {
    products = await searchServices.fetchSearchedProduct(
      context: context,
      searchQuery: widget.searchQuery,
      sort: _selectedSort,
    );
    setState(() {});
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Sort By', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              _buildSortTile('Newest Arrivals', 'newest'),
              _buildSortTile('Price: Low to High', 'price-low'),
              _buildSortTile('Price: High to Low', 'price-high'),
              _buildSortTile('Relevance', ''),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSortTile(String title, String value) {
    bool isSelected = _selectedSort == value;
    return ListSelectionTile(
      title: title,
      isSelected: isSelected,
      onTap: () {
        setState(() => _selectedSort = value);
        Navigator.pop(context);
        fetchSearchedProduct();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Container(
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              initialValue: widget.searchQuery,
              onFieldSubmitted: navigateToSearchScreen,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, color: Color(0xFF6366F1), size: 20),
                filled: false,
                border: InputBorder.none,
                hintText: 'Search MarketHub',
                hintStyle: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
                contentPadding: EdgeInsets.only(top: 10),
              ),
            ),
          ),
        ),
      ),
      body: products == null
          ? const Loader()
          : Column(
              children: [
                // Filter Bar
                _buildFilterBar(),
                
                Expanded(
                  child: products!.isEmpty
                      ? _buildNoResults()
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${products!.length} items found',
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
                                  ),
                                  GestureDetector(
                                    onTap: _showSortOptions,
                                    child: const Row(
                                      children: [
                                        Text('Sort', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
                                        Icon(Icons.sort_rounded, color: Color(0xFF6366F1), size: 18),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: GridView.builder(
                                padding: const EdgeInsets.all(16),
                                itemCount: products!.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.65,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        ProductDetailScreen.routeName,
                                        arguments: products![index],
                                      );
                                    },
                                    child: SearchedProduct(
                                      product: products![index],
                                      badge: index == 0 ? 'Featured' : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      height: 54,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
           _FilterBadge(label: 'All Categories', isActive: true),
           _FilterBadge(label: 'Top Rated'),
           _FilterBadge(label: 'MarketHub Verified'),
           _FilterBadge(label: 'Fast Delivery'),
        ],
      ),
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 20),
          Text(
            'No results for "${widget.searchQuery}"',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 8),
          const Text('Try adjusting your keywords or filters.', style: TextStyle(color: Color(0xFF94A3B8))),
        ],
      ),
    );
  }
}

class _FilterBadge extends StatelessWidget {
  final String label;
  final bool isActive;
  const _FilterBadge({required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF6366F1) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }
}

class ListSelectionTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ListSelectionTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? const Color(0xFF6366F1) : const Color(0xFF1E293B),
        ),
      ),
      trailing: isSelected ? const Icon(Icons.check_circle_rounded, color: Color(0xFF6366F1)) : null,
      onTap: onTap,
    );
  }
}
