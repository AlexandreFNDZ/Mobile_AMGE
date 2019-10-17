import 'package:amge/external_lib/cadastroScreen.dart';
import 'package:amge/external_lib/utilsScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {


  LoginScreen();

  @override
  Widget build(BuildContext context) {
    UtilsScreen screen = UtilsScreen.instance;

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
