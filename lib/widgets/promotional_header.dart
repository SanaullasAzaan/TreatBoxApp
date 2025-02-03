import 'package:flutter/material.dart';

class PromotionalHeader extends StatelessWidget {
  final String message;
  
  const PromotionalHeader({
    super.key,
    this.message = "Sign up today and get 20% off your first order!",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.local_offer,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 