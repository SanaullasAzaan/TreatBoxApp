import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
	final TextEditingController? controller;
	final Function(String)? onChanged;
	final VoidCallback? onSearchPressed;

	const CustomSearchBar({
		super.key,
		this.controller,
		this.onChanged,
		this.onSearchPressed,
	});

	@override
	Widget build(BuildContext context) {
		return Container(
			height: 55,
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(14),
				boxShadow: [
					BoxShadow(
						color: Colors.black.withOpacity(0.1),
						blurRadius: 8,
						offset: const Offset(0, 2),
					),
				],
			),
			child: TextField(
				controller: controller,
				onChanged: onChanged,
				decoration: InputDecoration(
					hintText: 'Search here...',
					hintStyle: const TextStyle(
						color: Colors.black,
						fontSize: 16,
					),
					
					suffixIcon: IconButton(
						icon: const Icon(
							Icons.search,
							color: Colors.black,
						),
						onPressed: onSearchPressed,
					),
					border: InputBorder.none,
					contentPadding: const EdgeInsets.symmetric(
						horizontal: 16,
						vertical: 12,
					),
				),
			),
		);
	}
}