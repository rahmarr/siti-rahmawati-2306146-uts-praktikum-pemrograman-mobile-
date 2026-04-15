import 'package:flutter/material.dart';

class QuestWidget extends StatelessWidget {
  final String title;
  final String reward;

  const QuestWidget({
    super.key,
    required this.title,
    required this.reward
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.only(bottom: 10),
  child: InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(14),
      child: Ink(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.pinkAccent.withAlpha(24),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black.withAlpha(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 4,
              offset: const Offset(0, 2)
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.pinkAccent.withAlpha(12),
                borderRadius: BorderRadius.circular(999)
              ),
              child: Icon(
                Icons.task_alt,
                color: const Color.fromARGB(255, 253, 80, 138),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  SizedBox(height: 2),
                  Text("Reward : $reward"),
                ],
              ),
            )
          ],
        ),
      ),
  ),
    );
  }
}