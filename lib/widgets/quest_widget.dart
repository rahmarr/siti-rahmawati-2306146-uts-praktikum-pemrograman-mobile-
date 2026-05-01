import 'package:flutter/material.dart';
import '../models/quest.dart';

class QuestWidget extends StatelessWidget {
  final Quest quest;
  final VoidCallback onTap;

  const QuestWidget({
    super.key,
    required this.quest,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFD1DC).withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: const Color(0xFFFFB7CE).withValues(alpha: 0.4),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(999)
                ),
                child: Icon(
                  quest.isTaken
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: const Color(0xFFFF69B4),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quest.title,
                      style: const TextStyle(
                        color: Color(0xFF4A4A4A),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "rank : ${quest.rank}",
                      style: const TextStyle(
                        color: Color(0xFFFF69B4),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Color(0xFFFF69B4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}