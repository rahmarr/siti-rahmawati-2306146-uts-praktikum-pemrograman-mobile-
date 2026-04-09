import 'package:flutter/material.dart';



class ChipWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final int value;

  const ChipWidget({super.key, required this.label, required this.icon, required this.color, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withAlpha(24),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: color.withAlpha(70),
        )
      ),
      child: Row(
        children: [
          Icon(icon, size: 19, color: color,),
          SizedBox(width: 10,),
          Text(label, style: TextStyle(color: color),),
          Text(value.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),


        ],
      ),
    );
  }
}