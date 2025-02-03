import 'package:flutter/material.dart';

class PromotionalBanner extends StatelessWidget {
	final String title;
	final String subtitle;
	final String imagePath;
	final double height;
	final List<Color> gradientColors;

	const PromotionalBanner({
		super.key,
		required this.title,
		required this.subtitle,
		required this.imagePath,
		this.height = 160,
		this.gradientColors = const [
			Color(0xFFFF8F71),
			Color(0xFFFF3C83),
		],
	});

	@override
	Widget build(BuildContext context) {
		return SizedBox(
			height: height + 30, // Additional height for overflow
			child: Stack(
				clipBehavior: Clip.none, // Allow children to overflow
				children: [
					// Base banner container
					Positioned(
						bottom: 0,
						left: 0,
						right: 0,
						height: height,
						child: Container(
							decoration: BoxDecoration(
								gradient: LinearGradient(
									colors: gradientColors,
									begin: Alignment.centerLeft,
									end: Alignment.centerRight,
								),
								borderRadius: BorderRadius.circular(16),
							),
							child: Column(
								children: [
									Expanded(
										child: Padding(
											padding: const EdgeInsets.all(20.0),
											child: Row(
												children: [
													// Left side content (title and subtitle)
													Expanded(
														flex: 3,
														child: Column(
															crossAxisAlignment: CrossAxisAlignment.start,
															mainAxisAlignment: MainAxisAlignment.center,
															children: [
																Text(
																	title,
																	style: const TextStyle(
																		color: Colors.white,
																		fontSize: 24,
																		fontWeight: FontWeight.bold,
																		fontFamily: 'Exo2',
																	),
																),
																const SizedBox(height: 8),
																Text(
																	subtitle,
																	style: const TextStyle(
																		color: Colors.white,
																		fontSize: 16,
																		fontFamily: 'Exo2',
																	),
																),
															],
														),
													),
													// Spacer for image space
													const Spacer(flex: 2),
												],
											),
										),
									),
									Container(
										height: height * 0.15, // 15% of banner height
										decoration: const BoxDecoration(
											color: Colors.black,
											borderRadius: BorderRadius.only(
												bottomLeft: Radius.circular(16),
												bottomRight: Radius.circular(16),
											),
										),
										child: Padding(
											padding: const EdgeInsets.symmetric(horizontal: 20.0),
											child: Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: [
													const Text(
														'Limited Time Offer!',
														style: TextStyle(
															color: Colors.white,
															fontSize: 14,
															fontWeight: FontWeight.bold,
															fontFamily: 'Exo2',
														),
													),
													const Icon(
														Icons.arrow_forward,
														color: Colors.white,
														size: 20,
													),
												],
											),
										),
									),
								],
							),
						),
					),
					// Breaking out image
					Positioned(
						right: 20,
						bottom: 0,
						top: -20, // Negative top to break out of container
						width: MediaQuery.of(context).size.width * 0.35,
						child: Image.asset(
							imagePath,
							fit: BoxFit.contain,
						),
					),
				],
			),
		);
	}
}