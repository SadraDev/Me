import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Me());
}

class Me extends StatefulWidget {
  const Me({Key? key}) : super(key: key);

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sadra Dev',
      theme: status ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor: status ? const Color(0xff121212) : Colors.grey[200],
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: FloatingActionButton(
            backgroundColor: status ? Colors.white : Colors.black,
            onPressed: () => setState(() => status = !status),
            child: Icon(status ? Icons.light_mode : Icons.dark_mode),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: <Widget>[
                  Card(
                    color: status ? const Color(0xff1e1e1e) : Colors.white,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape:
                        const CircleBorder(side: BorderSide(width: 0, color: Colors.transparent)),
                    child: Image.asset(
                      'images/me.png',
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 15),
                    child: Text(
                      "@SadraDev",
                      style: TextStyle(fontSize: 24, fontFamily: 'Poppins-Light'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                      'My personal web app💙 \n all my official links are here to contact with me🙌🏻',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontFamily: 'Poppins-ExtraLight'),
                    ),
                  ),  
                  MeCard(
                    status: status,
                    icon: FontAwesomeIcons.telegram,
                    iconColor: Colors.blue,
                    text: 'My Telegram',
                    url: 'https://t.me/SadiDev',
                  ),
                  MeCard(
                    status: status,
                    icon: FontAwesomeIcons.github,
                    iconColor: status ? Colors.white : Colors.black,
                    text: 'GitHub Profile',
                    url: 'https://github.com/SadraDev',
                  ),
                  MeCard(
                    status: status,
                    icon: FontAwesomeIcons.whatsapp,
                    iconColor: Colors.green,
                    text: 'My whatsapp',
                    url: 'https://api.whatsapp.com/send/?phone=%2B989370603580',
                  ),
                  MeCard(
                    status: status,
                    icon: FontAwesomeIcons.instagram,
                    iconColor: Colors.pink,
                    text: 'Instagram page',
                    url: 'https://www.instagram.com/SadraDev/',
                  ),
                  MeCard(
                    status: status,
                    icon: FontAwesomeIcons.twitter,
                    iconColor: Colors.blue[800],
                    text: 'I don\'t tweet much',
                    url: 'https://twitter.com/sadi_dev',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MeCard extends StatelessWidget {
  const MeCard({
    Key? key,
    required this.status,
    this.icon,
    this.text,
    this.iconColor,
    this.url,
    this.image,
  }) : super(key: key);

  final bool status;
  final IconData? icon;
  final Color? iconColor;
  final String? text;
  final String? url;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        color: status ? const Color(0xff1e1e1e) : Colors.white,
        child: InkWell(
          child: SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: <Widget>[
                  Visibility(
                    visible: icon == null ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Icon(
                        icon,
                        color: iconColor,
                        size: 50,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: image == null ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30, left: 23),
                      child: SizedBox(
                        child: Image.asset('$image'),
                        height: 60,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 10),
                    child: Text(
                      "$text",
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontFamily: 'Poppins-ExtraLight'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () async {
            if (await canLaunch('$url')) await launch('$url');
          },
        ),
      ),
    );
  }
}
