import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onBackPressed;

  const ScreenHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Positioned(
          top: 24,
          left: 46,
          child: GestureDetector(
            onTap: onBackPressed,
            child: Image.asset(
              'assets/images/backarrow.png',
              width: 32,
              height: 32,
            ),
          ),
        ),
        const SizedBox(height: 40),
        Text(
          title,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            fontFamily: 'Exo2',
            color: Colors.black,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            fontFamily: 'Exo2',
            color: Colors.black87,
            height: 1.5,
          ),
        ),
      ],
    );
  }
} 