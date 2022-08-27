import 'package:flutter/material.dart';

void main() {
  runApp(CatlogApp());
}

class CatlogApp extends StatelessWidget {
  const CatlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
        child: Container(
            child: Text("This my first app"),
        ),
        ),
      ),
    );
  }
}
