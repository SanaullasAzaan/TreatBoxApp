import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
	final String imagePath;
	final String title;
	final String description;
	final double borderRadius;
	final double? width;

	const CustomCard({
		Key? key,
		required this.imagePath,
		required this.title,
		required this.description,
		this.borderRadius = 10.0,
		this.width,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final screenWidth = MediaQuery.of(context).size.width;
		final cardWidth = width ?? screenWidth * 0.4;
		final cardHeight = cardWidth * 1.2;
		
		return SizedBox(
			width: cardWidth,
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Container(
						decoration: BoxDecoration(
							color: Colors.white,
							borderRadius: BorderRadius.circular(borderRadius),
							boxShadow: [
								BoxShadow(
									color: Colors.black.withOpacity(0.1),
									blurRadius: 4,
									offset: const Offset(0, 2),
								),
							],
						),
						child: Column(
							children: [
								ClipRRect(
									borderRadius: BorderRadius.only(
										topLeft: Radius.circular(borderRadius),
										topRight: Radius.circular(borderRadius),
									),
									child: Image.asset(
										imagePath,
										height: cardHeight * 0.50,
										width: cardWidth* 0.50,
										fit: BoxFit.contain,
									),
								),
								Container(
									width: cardWidth,
									decoration: BoxDecoration(
										color: Colors.black,
										borderRadius: BorderRadius.only(
											bottomLeft: Radius.circular(borderRadius),
											bottomRight: Radius.circular(borderRadius),
										),
									),
									padding: EdgeInsets.symmetric(
										horizontal: cardWidth * 0.1,
										vertical: cardHeight * 0.01,
									),
									child: Text(
										description,
										style: TextStyle(
											color: Colors.white,
											fontSize: cardWidth * 0.06,
										),
										maxLines: 1,
										overflow: TextOverflow.ellipsis,
									),
								),
							],
						),
					),
					Padding(
						padding: EdgeInsets.all(cardWidth * 0.01),
						child: Text(
							title,
							style: TextStyle(
								fontSize: cardWidth * 0.07,
								fontWeight: FontWeight.bold,
							),
							maxLines: 1,
							overflow: TextOverflow.ellipsis,
						),
					),
				],
			),
		);
	}
}
