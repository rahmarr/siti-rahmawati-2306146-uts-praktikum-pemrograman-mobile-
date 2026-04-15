import 'package:flutter/material.dart';
import 'package:pertemuan4_2306146/widgets/chip_widget.dart';
import 'package:pertemuan4_2306146/widgets/header_widget.dart';
import 'package:pertemuan4_2306146/widgets/quest_widget.dart';
void main() {
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<Map<String, String>> questList = [
  {"title": "Menjelajahi Dunia", "reward": "100 Gold"},
  {"title": "Mencari Harta Karun", "reward": "150 Gold"},
  {"title": "Mengumpulkan Bunga Langka", "reward": "300 Gold"},
];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adventure Game',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Adventure Game',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              HeaderWidget(name: "Rahma", role: "Warrior", level: 99),
              SizedBox(height: 10,),
            Row(
              spacing: 10,
              children: [
                  ChipWidget(label: "Favorite :", icon: Icons.favorite, color: Colors.pinkAccent, value: 100),
                  ChipWidget(label: "Star :", icon: Icons.star, color: const Color.fromARGB(255, 255, 59, 101), value: 90),
                  ChipWidget(label: "Favorite :", icon: Icons.favorite_border, color: const Color.fromARGB(255, 255, 70, 215), value: 80),
              
              ],
            ),
            SizedBox(height: 10),
Text("Quest list"),

Expanded(
  child: ListView(
    children: questList.map((quest) {
      return QuestWidget(
        title: quest["title"]!,
        reward: quest["reward"]!,
      );
    }).toList(),
  ),
)
            ],
          ),
        ),
      ),
    );  
  }
}
