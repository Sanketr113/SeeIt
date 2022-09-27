import 'package:catalogeapp/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../utils/aboutMe.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 48, 48, 48),
                  Color.fromARGB(255, 122, 122, 122),
                ],
                begin: const FractionalOffset(1.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        title: Text(
          "About Me",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'BreeSerif',
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: aboutMe(),
      drawer: myDrawer(),
    );
  }
}
