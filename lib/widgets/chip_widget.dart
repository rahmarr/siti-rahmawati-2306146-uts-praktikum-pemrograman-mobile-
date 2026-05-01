import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final int value;

  const ChipWidget({
    super.key, 
    required this.label, 
    required this.icon, 
    required this.color, 
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1), 
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 19, color: color),
          const SizedBox(width: 8),
          Text(
            "$label ", 
            style: const TextStyle(
              color: Color(0xFF4A4A4A), 
              fontSize: 13,
              fontWeight: FontWeight.w500
            ),
          ),
          Text(
            value.toString(), 
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF69B4),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}