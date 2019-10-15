import 'package:amge/external_lib/loginScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AMGE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Amge'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: LoginScreen(
          backgroundColor1: Color(0xFF68a1f8),
          backgroundColor2: Color(0xFF3339fa),
          highlightColor: Color(0xFF5e43fc),
          foregroundColor: Colors.white,
          logo: AssetImage("assets/images/logo.png"),
        ),
      ),
    );
  }
}
