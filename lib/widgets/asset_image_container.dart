import 'package:flutter/material.dart';

class AssetImageContainer extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit fit;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const AssetImageContainer({
    super.key,
    required this.imagePath,
    this.width = 40,
    this.height = 40,
    this.borderRadius = 20,
    this.fit = BoxFit.cover,
    this.backgroundColor = Colors.white,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: fit,
        ),
      ),
    );
  }
} 