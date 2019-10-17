import 'package:amge/external_lib/loginScreen.dart';
import 'package:amge/external_lib/utilsScreen.dart';
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
  
  MyHomePage({Key key, this.title,}) : super(key: key);

  final String title;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    UtilsScreen(Color(0xFF68a1f8), Color(0xFF3339fa), Color(0xFF5e43fc),
        Colors.white, AssetImage("assets/images/logo.png"), context);

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: LoginScreen(),
      ),
    );
  }
}
