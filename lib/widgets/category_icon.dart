import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
	final String imagePath;  // Changed from IconData to String
	final String title;
	final double imageSize;  // Changed from iconSize
	final VoidCallback? onTap;

	const CategoryIcon({
		super.key,
		required this.imagePath,  // Changed from icon
		required this.title,
		this.imageSize = 50.0,  // Adjusted default size
		this.onTap,
	});

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: onTap,
			child: Container(
				padding: const EdgeInsets.all(8.0),
				color: Colors.transparent,
				child: Column(
					mainAxisSize: MainAxisSize.min,
					children: [
						Container(
							width: imageSize,
							height: imageSize,
							decoration: BoxDecoration(
								color: Colors.white,
								borderRadius: BorderRadius.circular(12),
								boxShadow: [
									BoxShadow(
										color: Colors.black.withOpacity(0.1),
										blurRadius: 4,
										offset: const Offset(0, 2),
									),
								],
							),
							child: ClipRRect(
								borderRadius: BorderRadius.circular(12),
								child: Image.asset(
									imagePath,
									width: imageSize,
									height: imageSize,
									fit: BoxFit.cover,
								),
							),
						),
						const SizedBox(height: 4),
						Text(
							title,
							style: const TextStyle(
								fontSize: 12,
								color: Colors.black87,
								fontFamily: 'Exo2',
								fontWeight: FontWeight.w600,
							),
							textAlign: TextAlign.center,
						),
					],
				),
			),
		);
	}
}