import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
	final String assetImage;
	final String title;
	final String subtitle;
	final double? width;
	final double height;
	final VoidCallback? onTap;

	const CustomCard({
		super.key,
		required this.assetImage,
		required this.title,
		required this.subtitle,
		this.width,
		this.height = 320, // Increased default height
		this.onTap,
	});

	@override
	Widget build(BuildContext context) {
		// Get screen size for responsive calculations
		final screenSize = MediaQuery.of(context).size;
		final isSmallScreen = screenSize.width < 600;

		// Calculate responsive font sizes
		final titleFontSize = isSmallScreen ? 16.0 : 18.0;
		final subtitleFontSize = isSmallScreen ? 12.0 : 14.0;

		return GestureDetector(
			onTap: onTap,
			child: Container(
				width: width ?? screenSize.width * 0.9, // Default to 90% of screen width if not specified
				height: height,
				decoration: BoxDecoration(
					color: Colors.white,
					borderRadius: BorderRadius.circular(16),
					boxShadow: [
						BoxShadow(
							color: Colors.black.withOpacity(0.1),
							blurRadius: 8,
							offset: const Offset(0, 2),
						),
					],
				),
				child: LayoutBuilder(
					builder: (context, constraints) {
						return Column(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Expanded(
								  flex: 5, // Increased flex for image portion
								  child: ClipRRect(
									borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
									child: Image.asset(
									  assetImage,
									  fit: BoxFit.contain,
									  width: constraints.maxWidth * 0.8, // Slightly increased width
									  height: constraints.maxHeight * 0.45, // Increased height proportion
									),
								  ),
								),
								Expanded(
								  flex: 4,

									child: Padding(
										padding: EdgeInsets.all(constraints.maxWidth * 0.04), // Responsive padding
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: [
												Text(
													title,
													style: TextStyle(
														fontSize: titleFontSize,
														fontWeight: FontWeight.bold,
														fontFamily: 'Exo2',
														color: Colors.black87,
													),
													maxLines: 1,
													overflow: TextOverflow.ellipsis,
												),
												SizedBox(height: constraints.maxHeight * 0.02),
												Text(
													subtitle,
													style: TextStyle(
														fontSize: subtitleFontSize,
														fontFamily: 'Exo2',
														color: Colors.black54,
													),
													maxLines: 2,
													overflow: TextOverflow.ellipsis,
												),
											],
										),
									),
								),
							],
						);
					}
				),
			),
		);
	}
}