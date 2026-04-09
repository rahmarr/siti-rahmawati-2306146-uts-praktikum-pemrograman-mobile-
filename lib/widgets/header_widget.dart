import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String name;
  final String role;
  final int level;

  const HeaderWidget({super.key, required this.name, required this.role, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 85, 142),
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 248, 99, 161),
            const Color.fromARGB(255, 255, 123, 196)
          ],
          begin: .topStart,
          end: .bottomEnd
        ),
        borderRadius: BorderRadius.circular(19)
      ),
      padding: EdgeInsets.all(24),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage("https://picsum.photos/seed/picsum/200/300"),
              ),
              Positioned(
                right: 3,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ), 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: Colors.pinkAccent
                  ),
                  child: Text("level $level",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: .bold,
                  fontSize: 19      
                  )),
                Text("Role $role",)
              ],
            )

          )
        ],  
      ),
    );
  }
}