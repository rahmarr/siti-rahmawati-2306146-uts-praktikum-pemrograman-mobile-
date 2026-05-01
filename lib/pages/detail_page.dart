import 'package:flutter/material.dart';
import '../models/quest.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final Quest quest;

  const DetailPage({super.key, required this.quest});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F5),
      appBar: AppBar(
        title: Text(
          "🎀 quest detail 🎀",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFFF69B4), 
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pinkAccent.withValues(alpha: 0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.quest.image,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image_not_supported,
                      color: Colors.pinkAccent,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              widget.quest.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFD02090),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFF69B4).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "rank ${widget.quest.rank}",
                style: const TextStyle(
                  color: Color(0xFFFF69B4),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFFFD1DC)),
              ),
              child: Column(
                children: [
                  Text(
                    widget.quest.desc,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                  const Divider(height: 30, color: Color(0xFFFFD1DC)),
                  const Text(
                    "potential reward:",
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 13),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.quest.reward,
                    style: GoogleFonts.bubblegumSans(
                      fontSize: 26,
                      color: const Color(0xFFD02090),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF69B4),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  shadowColor: Colors.pinkAccent.withValues(alpha: 0.3),
                ),
                onPressed: widget.quest.isTaken
                    ? null
                    : () {
                        setState(() {
                          widget.quest.isTaken = true;
                        });
                        Navigator.pop(context);
                      },
                child: Text(
                  widget.quest.isTaken ? "already taken ✨" : "take quest 🎀",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}