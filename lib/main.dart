import 'package:flutter/material.dart';
import 'package:pertemuan4_2306146/widgets/chip_widget.dart';
import 'package:pertemuan4_2306146/widgets/header_widget.dart';
import 'package:pertemuan4_2306146/widgets/quest_widget.dart';
void main() {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {


  const MyApp({super.key});

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
              HeaderWidget(name: "Rahma", role: "Role", level: 99),
              SizedBox(height: 10,),
            Row(
              spacing: 10,
              children: [
                  ChipWidget(label: "HP :", icon: Icons.favorite, color: Colors.pinkAccent, value: 100),
                  ChipWidget(label: "Shield :", icon: Icons.shield, color: const Color.fromARGB(255, 255, 59, 101), value: 90),
                  ChipWidget(label: "Attack :", icon: Icons.star, color: const Color.fromARGB(255, 255, 70, 215), value: 80),
              
              ],
            ),
            Text("Quest list"),
            QuestWidget(),
            QuestWidget(),
            QuestWidget(),
            ],
          ),
        ),
      ),
    );  
  }
}
