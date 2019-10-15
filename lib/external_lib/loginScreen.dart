import 'package:amge/external_lib/utilsScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color highlightColor;
  final Color foregroundColor;
  final AssetImage logo;

  LoginScreen(
      {Key k,
      this.backgroundColor1,
      this.backgroundColor2,
      this.highlightColor,
      this.foregroundColor,
      this.logo});

  @override
  Widget build(BuildContext context) {
    UtilsScreen screen = new UtilsScreen(
      backgroundColor1: this.backgroundColor1,
      backgroundColor2: this.backgroundColor2,
      highlightColor: this.highlightColor,
      foregroundColor: this.foregroundColor,
      logo: this.logo,
      context: context,
    );

    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          //end: new Alignment(1.0, 6.0), // 10% of the width, so there are ten blinds.
          colors: [
            this.backgroundColor1,
            this.backgroundColor2
          ], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          screen.logotipo(),
          screen.formPadrao(Icons.account_circle,"Nome de Usuario"),
          screen.formSenha(),
          screen.forgetSenha(),
          screen.btnPadrao("Entrar"),
          new Expanded(
            child: Divider(),
          ),
          screen.bottomText("Sem cadastro? Crie um agora!")
        ],
      ),
    );
  }
}
