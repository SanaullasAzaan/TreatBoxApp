import 'package:flutter/material.dart';
import 'custom_bottom_nav_bar.dart';

/// Example usage of CustomBottomNavigationBar
///
/// This example demonstrates how to implement the CustomBottomNavigationBar
/// in a StatefulWidget screen/page.
class ExampleScreen extends StatefulWidget {
	const ExampleScreen({super.key});

	@override
	State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
	// Track the selected index for the bottom navigation
	int _selectedIndex = 0;

	// Handle navigation when an item is tapped
	void _onItemTapped(int index) {
		setState(() {
			_selectedIndex = index;
		});
		// Add your navigation logic here
		// For example:
		// switch (index) {
		//   case 0: // Home
		//     Navigator.pushNamed(context, '/home');
		//     break;
		//   case 1: // Categories
		//     Navigator.pushNamed(context, '/categories');
		//     break;
		//   // ... handle other cases
		// }
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Example Usage'),
			),
			// Your main content goes here
			body: Center(
				child: Text(
					'Selected Index: $_selectedIndex',
					style: Theme.of(context).textTheme.headlineMedium,
				),
			),
			// Implement the CustomBottomNavigationBar
			bottomNavigationBar: CustomBottomNavigationBar(
				selectedIndex: _selectedIndex,
				onItemSelected: _onItemTapped,
			),
		);
	}
}