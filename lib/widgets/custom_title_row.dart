import 'package:flutter/material.dart';

class CustomTitleRow extends StatelessWidget {
	final String title;
	final TextStyle? titleStyle;
	final Widget? trailing;
	final EdgeInsetsGeometry? padding;
	final MainAxisAlignment mainAxisAlignment;
	final CrossAxisAlignment crossAxisAlignment;

	const CustomTitleRow({
		super.key,
		required this.title,
		this.titleStyle,
		this.trailing,
		this.padding,
		this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
		this.crossAxisAlignment = CrossAxisAlignment.center,
	});

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
			child: Row(
				mainAxisAlignment: mainAxisAlignment,
				crossAxisAlignment: crossAxisAlignment,
				children: [
					Text(
						title,
						style: titleStyle ?? const TextStyle(
							fontSize: 24,
							fontWeight: FontWeight.bold,
							fontFamily: 'Exo2',
							color: Colors.black87,
						),
					),
					if (trailing != null) trailing!,
				],
			),
		);
	}
}