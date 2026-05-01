import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String role;
  final int level;
  final String rank;

  const HeaderWidget({
    super.key,
    required this.name,
    required this.role,
    required this.level,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0F5),
        gradient: LinearGradient(
          colors: [
            const Color(0xFFFFF0F5),
            const Color(0xFFFFE4E1).withValues(alpha: 0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: const Color(0xFFFFD1DC),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage("https://picsum.photos/seed/picsum/200/300"),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: const Color(0xFFFF69B4),
                    ),
                    child: Text(
                      "level $level",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFFFF69B4),
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Text(
                  role,
                  style: const TextStyle(
                    color: Color(0xFFD02090),
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFF69B4).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              rank,
              style: GoogleFonts.bubblegumSans(
                textStyle: const TextStyle(
                  fontSize: 32,
                  color: Color(0xFFD02090),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}