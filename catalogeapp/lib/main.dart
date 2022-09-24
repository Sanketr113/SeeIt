import 'package:catalogeapp/Pages/homepage.dart';
import 'package:catalogeapp/Pages/loginpage.dart';
import 'package:catalogeapp/Pages/profile.dart';
import 'package:catalogeapp/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CatalogApp());
}

class CatalogApp extends StatelessWidget {
  const CatalogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightBlue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.profileRoute: (context) => ProfilePage()
      },
    );
  }
}
