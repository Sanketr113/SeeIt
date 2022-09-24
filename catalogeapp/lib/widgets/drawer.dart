import 'package:catalogeapp/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    void profile() {
      Navigator.popAndPushNamed(context, MyRoutes.profileRoute);
    }

    void homepage() {
      Navigator.popAndPushNamed(context, MyRoutes.homeRoute);
    }

    return Drawer(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      child: Container(
        color: Color.fromARGB(255, 0, 0, 0),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.black),
                accountName: Text(
                  "Sanket Raut",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                accountEmail: Text(
                  "rautsanket113@gmail.com",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      ExactAssetImage('assets/images/Sanket01.png'),
                  //fit: BoxFit.cover,
                ),
              ),
            ),
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
                'Profile',
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
          ],
        ),
      ),
    );
  }
}

Future<void> launchEmail() async {
  final url = 'mailto:rautsanket113@gmail.com?';
  await launch(url);
}
