import 'package:flutter/material.dart';
import 'package:treatboxrefurbisshed/widgets/custom_search_bar.dart';
import 'package:treatboxrefurbisshed/widgets/custom_bottom_nav_bar.dart';
import 'package:treatboxrefurbisshed/widgets/custom_title_row.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 1; // Set to 1 since Categories is the second item

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    // Add slight delay to allow state update to complete before navigation
    if (index == 0) {
      Future.delayed(const Duration(milliseconds: 100), () {
        Navigator.of(context).pop();
      });
      return;
    }
    
    switch (index) {
      case 1:
        // Already on Categories
        break;
      case 2:
        // Navigate to Cart - implement cart navigation later
        break;
      case 3:
        // Navigate to Scan - implement scan navigation later
        break;
    }
  }

  final List<Map<String, String>> categoryData = [
    {
      'assetImage': 'assets/images/onb1.png',
      'title': 'Birthday Cakes',
      'subtitle': 'Special celebration cakes',
    },
    {
      'assetImage': 'assets/images/onb2.png',
      'title': 'Wedding Cakes',
      'subtitle': 'Elegant tiered masterpieces',
    },
    {
      'assetImage': 'assets/images/onb3.png',
      'title': 'Cupcakes',
      'subtitle': 'Delicious assorted cupcakes',
    },
    {
      'assetImage': 'assets/images/onb1.png',
      'title': 'Ice Cream',
      'subtitle': 'Cool and refreshing treats',
    },
    {
      'assetImage': 'assets/images/onb1.png',
      'title': 'Cookies',
      'subtitle': 'Fresh baked cookies',
    },
    {
      'assetImage': 'assets/images/onb1.png',
      'title': 'Pastries',
      'subtitle': 'Flaky and delicious',
    },
    {
      'assetImage': 'assets/images/onb1.png',
      'title': 'Donuts',
      'subtitle': 'Sweet and colorful',
    },
    {
      'assetImage': 'assets/images/onb1.png',
      'title': 'Brownies',
      'subtitle': 'Rich chocolate treats',
    },
    {
      'assetImage': 'assets/images/onb1.png',
      'title': 'Macarons',
      'subtitle': 'French delicacies',
    },
    {
      'assetImage': 'assets/images/onb1.png',
      'title': 'Cheesecakes',
      'subtitle': 'Creamy classic desserts',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 218, 208, 1),
        body: Column(
        children: [
          Expanded(
          child: SafeArea(
            bottom: false,  // Don't add padding at bottom for navigation bar
            child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const CustomTitleRow(
                title: 'Categories',
                padding: EdgeInsets.zero,
              ),

                    const SizedBox(height: 16),
                    CustomSearchBar(
                      controller: _searchController,
                      onChanged: (value) {
                        // Handle search
                      },
                      onSearchPressed: () {
                        // Handle search button press
                      },
                    ),
                    const SizedBox(height: 24),
                    const CustomTitleRow(
                      title: 'Popular Categories',
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 180,  // Adjusted height
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryData.length,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                        
                        },
                        ),
                      ),
                      const SizedBox(height: 24),
                      const CustomTitleRow(
                        title: 'Popular Items',
                        padding: EdgeInsets.zero,
                      ),
                      ],
                    ),
                    ),
                  ),
                  ),
          CustomBottomNavigationBar(
            selectedIndex: _selectedIndex,
            onItemSelected: _onItemSelected,
          ),
        ],
      ),
    );
  }
}
