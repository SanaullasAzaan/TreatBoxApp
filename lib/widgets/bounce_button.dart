import 'package:flutter/material.dart';

class BounceButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;

  const BounceButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.height = 56,
  });

  @override
  State<BounceButton> createState() => _BounceButtonState();
}

class _BounceButtonState extends State<BounceButton> with SingleTickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _bounceAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: -10),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -10, end: 0),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0, end: -6),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -6, end: 0),
        weight: 25,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _bounceController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  void _startBounceAnimation() {
    _bounceController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _bounceAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _bounceAnimation.value),
            child: Material(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  _startBounceAnimation();
                  widget.onPressed();
                },
                child: Center(
                  child: Text(
                    widget.text,
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
        },
      ),
    );
  }
} 