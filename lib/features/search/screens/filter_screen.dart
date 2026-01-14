import 'package:markethub/constants/global_variables.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/search-filters';
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _priceRange = const RangeValues(0, 1000);
  String _selectedSort = 'Relevance';
  final List<String> _brands = ['Samsung', 'Apple', 'Sony', 'Nike', 'Adidas'];
  final Map<String, bool> _selectedBrands = {};

  @override
  void initState() {
    super.initState();
    for (var brand in _brands) {
      _selectedBrands[brand] = false;
    }
  }

  void applyFilters() {
    // Return filters to search screen
    Navigator.pop(context, {
      'priceRange': _priceRange,
      'sort': _selectedSort,
      'brands': _selectedBrands.entries.where((e) => e.value).map((e) => e.key).toList(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Filters',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _priceRange = const RangeValues(0, 1000);
                  _selectedSort = 'Relevance';
                  for (var key in _selectedBrands.keys) {
                    _selectedBrands[key] = false;
                  }
                });
              },
              child: const Text('Reset', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sort By',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              children: ['Relevance', 'Price: Low to High', 'Price: High to Low', 'Newest First']
                  .map((sort) => ChoiceChip(
                        label: Text(sort),
                        selected: _selectedSort == sort,
                        selectedColor: GlobalVariables.secondaryColor,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedSort = sort;
                          });
                        },
                      ))
                  .toList(),
            ),
            const Divider(height: 48),
            const Text(
              'Price Range',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${_priceRange.start.round()}'),
                Text('\$${_priceRange.end.round()}'),
              ],
            ),
            RangeSlider(
              values: _priceRange,
              min: 0,
              max: 5000,
              divisions: 50,
              activeColor: GlobalVariables.secondaryColor,
              labels: RangeLabels(
                '\$${_priceRange.start.round()}',
                '\$${_priceRange.end.round()}',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _priceRange = values;
                });
              },
            ),
            const Divider(height: 48),
            const Text(
              'Brands',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Column(
              children: _brands.map((brand) {
                return CheckboxListTile(
                  title: Text(brand),
                  value: _selectedBrands[brand],
                  activeColor: GlobalVariables.secondaryColor,
                  onChanged: (bool? value) {
                    setState(() {
                      _selectedBrands[brand] = value!;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: applyFilters,
          style: ElevatedButton.styleFrom(
            backgroundColor: GlobalVariables.secondaryColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Apply Filters', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
