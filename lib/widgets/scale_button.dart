import 'package:flutter/material.dart';

class ScaleButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;

  const ScaleButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.height = 56,
  });

  @override
  State<ScaleButton> createState() => _ScaleButtonState();
}

class _ScaleButtonState extends State<ScaleButton> with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: Matrix4.identity()..scale(_isPressed ? 0.95 : 1.0),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Material(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: widget.onPressed,
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
        ),
      ),
    );
  }
} 