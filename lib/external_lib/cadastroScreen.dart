import 'package:amge/external_lib/loginScreen.dart';
import 'package:amge/external_lib/utilsScreen.dart';
import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color highlightColor;
  final Color foregroundColor;
  final AssetImage logo;

  CadastroScreen(
      {Key k,
      this.backgroundColor1,
      this.backgroundColor2,
      this.highlightColor,
      this.foregroundColor,
      this.logo});

  @override
  Widget build(BuildContext context) {
    UtilsScreen screen = UtilsScreen.instance;

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
          screen.formPadrao(Icons.alternate_email,"Email"),
          screen.formSenha("Senha"),
          screen.formSenha("Confirmar Senha"),
          screen.forgetSenha(),
          screen.btnPadrao("Cadastrar",LoginScreen()),
          new Expanded(
            child: Divider(),
          ),
          screen.bottomText("Já Cadastrado? Entre Agora!")
        ],
      ),
    );
  }
}