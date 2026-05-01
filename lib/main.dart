import 'package:flutter/material.dart';
import 'models/quest.dart';
import 'pages/login_page.dart';
import 'pages/detail_page.dart';
import 'widgets/chip_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/quest_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Quest> questList = [
    Quest(
      title: "find lost ribbon 🎀",
      rank: "R",
      reward: "150 pink gems",
      desc: "cari pita pink kesayangan putri yang hilang di taman bunga.",
      image: "https://picsum.photos/200",
    ),
    Quest(
      title: "bake sweet cupcake 🧁",
      rank: "S",
      reward: "200 candy coins",
      desc: "bantu peri dapur membuat cupcake manis untuk pesta kerajaan.",
      image: "https://picsum.photos/201",
    ),
    Quest(
      title: "collect love letters 💌",
      rank: "L",
      reward: "300 heart points",
      desc: "kumpulkan surat cinta yang tersebar di desa pink valley.",
      image: "https://picsum.photos/202",
    ),
    Quest(
    title: "defeat cute kitty 🐱",
    rank: "C",
    reward: "400 sparkle dust",
    desc: "tangkap kucing nakal yang mencuri aksesoris lucu warga.",
    image: "https://picsum.photos/203",
  ),
  Quest(
    title: "princess tea party ☕",
    rank: "P",
    reward: "500 royal charm",
    desc: "hadiri tea party kerajaan dan bantu dekorasi meja aesthetic.",
    image: "https://picsum.photos/204",
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sweet adventure',
      initialRoute: "/login",
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          if (settings.arguments == null || settings.arguments is! Map) {
            return MaterialPageRoute(
              builder: (context) => const LoginPage(),
            );
          }

          final args =
              Map<String, dynamic>.from(settings.arguments as Map);

          return MaterialPageRoute(
            builder: (context) => HomePage(
              userData: args,
              questList: questList,
            ),
          );
        }

        if (settings.name == "/login") {
          return MaterialPageRoute(
            builder: (context) => const LoginPage(),
          );
        }

        if (settings.name == "/detail") {
          final quest = settings.arguments as Quest;
          return MaterialPageRoute(
            builder: (context) => DetailPage(quest: quest),
          );
        }

        return null;
      },
    );
  }
}

class HomePage extends StatefulWidget {
  final Map<String, dynamic> userData;
  final List<Quest> questList;

  const HomePage({
    super.key,
    required this.userData,
    required this.questList,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar( title: Text( "🎀 pink adventure 🎀",
      style: TextStyle(color: Colors.white),
       ), 
       backgroundColor:const Color(0xFFFF69B4),
       elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            HeaderWidget(
              name: widget.userData['name'],
              role: widget.userData['job'],
              level: int.parse(widget.userData['level']),
              rank: widget.userData['rank'],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                ChipWidget(
                    label: "love: ",
                    icon: Icons.favorite,
                    color: Colors.pinkAccent,
                    value: 100),
                SizedBox(width: 10),
                ChipWidget(
                    label: "charm: ",
                    icon: Icons.auto_awesome,
                    color: Color(0xFFFFA6C9),
                    value: 90),
                SizedBox(width: 10),
                ChipWidget(
                    label: "cake: ",
                    icon: Icons.cake,
                    color: Color(0xFFFFC1E3),
                    value: 95),
              ],
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "today's quest",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: widget.questList.map((quest) {
                  return QuestWidget(
                    quest: quest,
                    onTap: () async {
                      await Navigator.pushNamed(
                        context,
                        "/detail",
                        arguments: quest,
                      );
                      setState(() {});
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}