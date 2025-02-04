import 'package:flutter/material.dart';
import 'package:treatboxrefurbisshed/screens/pizza_screen.dart';
import 'package:treatboxrefurbisshed/widgets/asset_image_container.dart';
import 'package:treatboxrefurbisshed/widgets/category_icon.dart';
import 'package:treatboxrefurbisshed/widgets/custom_search_bar.dart';
import 'package:treatboxrefurbisshed/widgets/icon_container.dart';
import 'package:treatboxrefurbisshed/widgets/promotional_banner.dart';
import 'package:treatboxrefurbisshed/widgets/custom_bottom_nav_bar.dart';
import 'package:treatboxrefurbisshed/widgets/custom_card.dart';
import 'package:treatboxrefurbisshed/screens/categories_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onItemSelected(int index) {
    if (index == _selectedIndex) return;  // Don't process if already on the selected tab

    setState(() {
      _selectedIndex = index;  // Update the selected index first
    });

    switch (index) {
      case 0:
        // Already on home
        break;
      case 1:
        // Navigate to Categories
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CategoriesScreen(),
          ),
        ).then((_) {
          // When returning from Categories, ensure we're showing home as selected
          setState(() {
            _selectedIndex = 0;
          });
        });
        break;
      case 2:
        // Navigate to Cart - implement later
        break;
      case 3:
        // Navigate to Scan - implement later
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 218, 208, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconContainer(
                          icon: Icons.location_on_outlined,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Bangalore, India',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Exo2',
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    AssetImageContainer(
                      imagePath: 'assets/images/homeui/profileimg.png',
                      width: 45,
                      height: 45,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomSearchBar(
                  controller: _searchController,
                  onChanged: (value) {
                    // Handle search text changes
                  },
                  onSearchPressed: () {
                    // Handle search button press
                  },
                ),
                const SizedBox(height: 16),
                const PromotionalBanner(
                  title: 'Special Offer',
                  subtitle: 'Get 20% off on your first order!',
                    imagePath: 'assets/images/onb1.png',
                ),
                const SizedBox(height: 16),
                
                
                SizedBox(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                        CategoryIcon(
                        imagePath: 'assets/images/categories/cacke.png',
                        title: 'Cakes',
                        ),
                        CategoryIcon(
                        imagePath: 'assets/images/categories/pizza.png',
                        title: 'Ice Cream',
                        ),
                        CategoryIcon(
                        imagePath: 'assets/images/categories/fries.png',
                        title: 'Cookies',
                        ),
                        CategoryIcon(
                        imagePath: 'assets/images/categories/Bevrages.png',
                        title: 'Pizza',
                        ),
                        CategoryIcon(
                        imagePath: 'assets/images/categories/chips.png',
                        title: 'Beverages',
                        ),
                        CategoryIcon(
                        imagePath: 'assets/images/categories/burger.png',
                        title: 'Breakfast',
                        ),
                         CategoryIcon(
                        imagePath: 'assets/images/categories/chips.png',
                        title: 'Beverages',
                        ),
                        CategoryIcon(
                        imagePath: 'assets/images/categories/burger.png',
                        title: 'Breakfast',
                        ),
                    ],
                    ),
                  ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 260,
                      child: ListView(
                      scrollDirection: Axis.horizontal,
                        children: [
                        CustomCard(
                          imagePath: 'assets/images/p1.png',
                          title: 'Pizza',
                          description: 'From ₹ 99',
                          width: 165,
                          onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => const PizzaScreen(),
                            ),
                          );
                          },
                        ),
                        const SizedBox(width: 12),
                        const CustomCard(
                          imagePath: 'assets/images/burgers/burger1.png',
                          title: 'Burger',
                          description: 'From ₹ 89',
                          width: 165,
                        ),
                        const SizedBox(width: 12),
                        const CustomCard(
                          imagePath: 'assets/images/b1.png',
                          title: 'Bevrages',
                          description: 'From ₹ 59',
                          width: 165,
                        ),
                      ],
                      ),
                    ),
                  ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
      ),
    );
  }
}

