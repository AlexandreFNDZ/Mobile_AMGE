import 'package:amge/controller/controllerUser.dart';
import 'package:amge/model/redefinirDialog.dart';
import 'package:amge/pages/cadastroScreen.dart';
import 'package:amge/external_lib/utilsScreen.dart';
import 'package:amge/pages/telaPrincipal.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AMGE',
      theme: ThemeData(
        canvasColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Amge'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UtilsScreen screen = UtilsScreen.getInstance(
    backgroundColor1: Color(0xFF68a1f8),
    backgroundColor2: Color(0xFF3339fa),
    highlightColor: Color(0xFF5e43fc),
    foregroundColor: Colors.white,
    logo: AssetImage("assets/images/logo.png"),
  );
  TextEditingController txtUsuarioController = TextEditingController();
  TextEditingController txtSenhaController = TextEditingController();
  ControllerUser ctrlUsuario = ControllerUser();

  @override
  Widget build(BuildContext context) {
    UtilsScreen screen = UtilsScreen.getInstance(
      backgroundColor1: Color(0xFF68a1f8),
      backgroundColor2: Color(0xFF3339fa),
      highlightColor: Color(0xFF5e43fc),
      foregroundColor: Colors.white,
      logo: AssetImage("assets/images/logo.png"),
    );
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: loginScreen(),
          ),
        ),
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
          logotipo(100.0, 100.0),
          formPadrao(),
          formSenha(),
          forgetSenha(),
          btnPadrao(),
          new Expanded(
            child: Divider(),
          ),
          bottomTextPush(),
        ],
      ),
    );
  }

  Widget logotipo(double top, double bot) {
    return Container(
      padding: EdgeInsets.only(top: top, bottom: bot),
      child: Center(
        child: new Column(
          children: <Widget>[
            new Container(
              height: 120.0,
              //width: 300,
              // margin: const EdgeInsets.only(left: 40.0, right: 40.0),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                // boxShadow: <BoxShadow>[
                //   BoxShadow(
                //     color: Colors.black,
                //     offset: Offset(5.0, 5.0),
                //     blurRadius: 5.0,
                //   ),
                // ],
                shape: BoxShape.rectangle,
                image: DecorationImage(image: screen.logo),
                // borderRadius: BorderRadius.horizontal(
                //   left: Radius.circular(40),
                //   right: Radius.circular(40),
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget formPadrao() {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: screen.foregroundColor,
              width: 0.5,
              style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
            child: Icon(
              Icons.account_circle,
              color: screen.foregroundColor,
            ),
          ),
          new Expanded(
            child: TextField(
              style: TextStyle(
                color: screen.foregroundColor,
                fontFamily: 'VT323',
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Nome de Usuario",
                labelStyle: TextStyle(
                  color: screen.foregroundColor,
                  fontFamily: 'Roboto',
                  fontSize: 18,
                ),
                contentPadding: EdgeInsets.only(left: 20),
                border: InputBorder.none,
                //hintText: 'Nome de usuário',
                //hintStyle: TextStyle(color: this.foregroundColor),
              ),
              onSubmitted: (valor) {
                txtUsuarioController.text = valor;
              },
              controller: txtUsuarioController,
            ),
          ),
        ],
      ),
    );
  }

  Widget formSenha() {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: screen.foregroundColor,
              width: 0.5,
              style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
            child: Icon(
              Icons.lock_open,
              color: screen.foregroundColor,
            ),
          ),
          new Expanded(
            child: TextField(
              obscureText: true,
              style: TextStyle(
                color: screen.foregroundColor,
                fontFamily: 'VT323',
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: screen.foregroundColor,
                  fontFamily: 'Roboto',
                  fontSize: 18,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
                //hintText: 'Senha',
                //hintStyle: TextStyle(color: this.foregroundColor),
              ),
              onSubmitted: (valor) {
                txtSenhaController.text = valor;
              },
              controller: txtSenhaController,
            ),
          ),
        ],
      ),
    );
  }

  Widget forgetSenha() {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
      alignment: Alignment.center,
      child: new Row(
        children: <Widget>[
          new Container(
            width: 150,
          ),
          new Expanded(
            child: new FlatButton(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              color: Colors.transparent,
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (context) {
                    return new RedefinirSenha().confirmaScreen(context, screen);
                  }
                )
              },
              child: Text(
                "Esqueceu a senha?",
                textAlign: TextAlign.end,
                style:
                    TextStyle(color: screen.foregroundColor.withOpacity(0.8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget btnPadrao() {
    bool validou;
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 8.0),
      alignment: Alignment.center,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              child: new FlatButton(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                color: screen.foregroundColor,
                onPressed: () => {
                  validou = ctrlUsuario.validaLogin(
                    txtUsuarioController.text,
                    txtSenhaController.text,
                  ),
                  if (validou)
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaPrincipal(),
                        ),
                      )
                    }
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    color: screen.backgroundColor2,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTextPush() {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(
          left: 40.0, right: 40.0, top: 10.0, bottom: 20.0),
      alignment: Alignment.center,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new FlatButton(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              color: Colors.transparent,
              onPressed: () => {
                Navigator.push(
                  this.context,
                  MaterialPageRoute(builder: (context) => CadastroScreen()),
                ),
              },
              child: Text(
                "Sem cadastro? Crie um agora!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: screen.foregroundColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
