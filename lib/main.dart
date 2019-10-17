import 'package:amge/pages/cadastroScreen.dart';
import 'package:amge/external_lib/utilsScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

UtilsScreen screen;

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
    screen = UtilsScreen(Color(0xFF68a1f8), Color(0xFF3339fa), Color(0xFF5e43fc),
        Colors.white, AssetImage("assets/images/logo.png"), context);
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: loginScreen(),
      ),
    );
  }

  Container loginScreen() {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          //end: new Alignment(1.0, 6.0), // 10% of the width, so there are ten blinds.
          colors: [
            screen.backgroundColor1,
            screen.backgroundColor2
          ], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          screen.logotipo(),
          screen.formPadrao(Icons.account_circle,"Nome de Usuario"),
          screen.formSenha("Senha"),
          screen.forgetSenha(),
          screen.btnPadrao("Entrar",CadastroScreen()),
          new Expanded(
            child: Divider(),
          ),
          screen.bottomText("Sem cadastro? Crie um agora!")
        ],
      ),
    );
  }
}
