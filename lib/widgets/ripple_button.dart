 

import 'package:flutter/material.dart';

class RippleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;

  const RippleButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.height = 56,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Material(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.white.withOpacity(0.3),
          highlightColor: Colors.white.withOpacity(0.1),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Exo2',
              ),
            ),
          ),
        ),
      ),
    );
  }
} 