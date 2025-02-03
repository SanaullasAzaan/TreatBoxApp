import 'package:flutter/material.dart';

class ShimmerButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;

  const ShimmerButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.height = 56,
  });

  @override
  State<ShimmerButton> createState() => _ShimmerButtonState();
}

class _ShimmerButtonState extends State<ShimmerButton> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _shimmerAnimation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _shimmerController,
        curve: Curves.easeInOutSine,
      ),
    );
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _shimmerAnimation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: const [
                  Colors.black,
                  Color(0xFF333333),
                  Colors.black,
                ],
                stops: [
                  _shimmerAnimation.value - 1,
                  _shimmerAnimation.value,
                  _shimmerAnimation.value + 1,
                ],
              ),
            ),
            child: ElevatedButton(
              onPressed: widget.onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
} 