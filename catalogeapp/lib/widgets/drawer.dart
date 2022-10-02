import 'package:catalogeapp/Pages/loginpage.dart';
import 'package:catalogeapp/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart';

import '../Pages/homepage.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        this.context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    void profile() {
      Navigator.popAndPushNamed(context, MyRoutes.AboutMeRoute);
    }

    void homepage() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    }

    void loginpage() {
      Navigator.popAndPushNamed(context, MyRoutes.loginRoute);
    }

    return Drawer(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      child: Container(
        color: Color.fromARGB(255, 0, 0, 0),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.black
                      // gradient: LinearGradient(
                      //   colors: [
                      //     Color.fromARGB(255, 29, 29, 29),
                      //     Color.fromARGB(255, 63, 63, 63),
                      //   ],
                      //   begin: Alignment.centerLeft,
                      //   end: Alignment.centerRight,
                      // ),
                      ),
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/Logo01.png',
                        height: 50,
                        width: 10,
                      ))),
              ListTile(
                onTap: () => homepage(),
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.grey,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () => profile(),
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.grey,
                ),
                title: Text(
                  'About Me',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () => launchEmail(),
                leading: Icon(
                  CupertinoIcons.phone,
                  color: Colors.grey,
                ),
                title: Text(
                  'Contact me',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              ListTile(
                onTap: (() {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Do you want to logout'),
                    duration: Duration(seconds: 5),
                    action: SnackBarAction(
                        label: "Logout", onPressed: (() => signOut())),
                  ));
                }),
                leading: Icon(Icons.logout_rounded),
                iconColor: Colors.grey,
                title: Text('SignOut',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> launchEmail() async {
  final url = 'mailto:rautsanket113@gmail.com?';
  await launch(url);
}
