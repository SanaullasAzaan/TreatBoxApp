import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? backgroundColor;
  final Color? iconColor;
  final double padding;
  final double borderRadius;
  final double containerSize;

  const IconContainer({
    super.key,
    required this.icon,
    this.size = 24,
    this.backgroundColor = Colors.white,
    this.iconColor,
    this.padding = 8.0,
    this.borderRadius = 20,
    this.containerSize = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: size,
        color: iconColor ?? Theme.of(context).iconTheme.color,
      ),
    );
  }
}
