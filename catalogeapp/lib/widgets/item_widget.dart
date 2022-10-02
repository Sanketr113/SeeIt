import 'package:catalogeapp/Models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemWidget extends StatelessWidget {
  final Items item;

  const ItemWidget({Key? key, required this.item})
      // ignore: unnecessary_null_comparison
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.black,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.white)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Ink.image(
                  image: NetworkImage(item.images),
                  height: 240,
                  fit: BoxFit.fitHeight,
                  child: InkWell(
                    onTap: () async {
                      String url = item.details;
                      Launch(url);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              item.name,
              style: TextStyle(
                  letterSpacing: 0.0000005,
                  fontSize: 25,
                  fontFamily: 'BankGothic',
                  color: Color.fromARGB(255, 255, 17, 0)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              item.desc,
              style: TextStyle(color: Colors.white),
            ),
            ButtonBar(
              children: [
                
                 Text(item.price,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 105, 151, 236),
                      )),
                  
                
              ],
            ),
          ]),
        ),
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 20.0,
        )
      ]),
    );
  }
}

void Launch(String url) async {
  await launch(url, enableJavaScript: true, forceWebView: true);
}
