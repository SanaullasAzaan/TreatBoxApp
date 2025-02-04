import 'package:flutter/material.dart';
import 'package:treatboxrefurbisshed/widgets/custom_search_bar.dart';
import 'package:treatboxrefurbisshed/widgets/screen_header.dart';

class PizzaScreen extends StatefulWidget {
	const PizzaScreen({super.key});

	@override
	State<PizzaScreen> createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
	final TextEditingController _searchController = TextEditingController();

	@override
	void dispose() {
		_searchController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: const Color.fromRGBO(226, 218, 208, 1),
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.all(16.0),
					child: Column(
						children: [
							ScreenHeader(
								title: '',
								subtitle: '',
								onBackPressed: () {
									Navigator.pop(context);
								},
							),
							const SizedBox(height: 24),
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
							// Add rest of your pizza screen content here
						],
					),
				),
			),
		);
	}
}