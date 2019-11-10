import 'package:amge/external_lib/utilsScreen.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  UtilsScreen screen = UtilsScreen.getInstance(
    backgroundColor1: Color(0xFF68a1f8),
    backgroundColor2: Color(0xFF3339fa),
    highlightColor: Color(0xFF5e43fc),
    foregroundColor: Colors.white,
    logo: AssetImage("assets/images/logo.png"),
  );
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(image: screen.logo),
              ),
            ),
            SizedBox(height: 80,),
            Text(
              "Em Breve!",
              style: TextStyle(color: Colors.blue, fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
