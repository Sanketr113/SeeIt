import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class aboutMe extends StatefulWidget {
  const aboutMe({Key? key}) : super(key: key);

  @override
  State<aboutMe> createState() => _aboutMeState();
}

class _aboutMeState extends State<aboutMe> {
  final double coverHeight = 280;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.zero, children: [
        buildtop(),
        buildcontent(),
        buildText(),
      ]),
    );
  }
}

Widget buildtop() => Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 130), child: buildCoverImage()),
        Positioned(top: 220, child: buildProfileImage()),
      ],
    );

Widget buildCoverImage() => Container(
      color: Colors.grey,
      child: Image.asset(
        'assets/images/background.png',
        fit: BoxFit.cover,
      ),
      width: double.infinity,
      height: 280,
      // key: BoxFit.cover,
    );

Widget buildProfileImage() => CircleAvatar(
      radius: 100,
      //backgroundColor: Colors.transparent,
      backgroundColor: Color.fromARGB(255, 48, 48, 48),
      child: CircleAvatar(
        radius: 90,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('assets/images/Sanket02.png'),
      ),
    );

Widget buildcontent() => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Center(
        child: Column(children: [
          Text(
            "Sanket Raut",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Flutter Software Developer",
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 18,
              ),
              buildSocialIcon(
                  FontAwesomeIcons.github, 'https://github.com/Sanketr113'),
              const SizedBox(
                width: 20,
              ),
              buildSocialIcon(FontAwesomeIcons.instagram,
                  'https://www.instagram.com/raut_sanket_03/'),
              const SizedBox(
                width: 20,
              ),
              buildSocialIcon(FontAwesomeIcons.twitter,
                  'https://twitter.com/orig_SR03?t=nLrcnWfF9DVUpb6IbGlWlA&s=08'),
              const SizedBox(
                width: 20,
              ),
              buildSocialIcon(FontAwesomeIcons.linkedin,
                  'https://www.linkedin.com/in/sanket-raut-6b1a00228'),
              const SizedBox(
                width: 20,
              ),
              buildSocialIcon(FontAwesomeIcons.facebook,
                  'https://www.facebook.com/profile.php?id=100074343914034'),
            ],
          ),
        ]),
      ),
    );

Widget buildText() => Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "About",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              "Flutter Software Developer and B.tech Undergrad at Indian Institute of Technology Sricity.")
        ],
      ),
    );

Widget buildSocialIcon(IconData icon, String iconurl) => CircleAvatar(
      radius: 18,
      child: Material(
        shape: CircleBorder(),
        // clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            String url = iconurl;
            Launch(url);
          },
          child: Icon(icon, size: 35),
        ),
      ),
    );
void Launch(String url) async {
  await launch(url, enableJavaScript: true, forceWebView: true);
}
