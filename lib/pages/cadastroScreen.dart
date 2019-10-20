import 'package:amge/controller/controllerUser.dart';
import 'package:amge/external_lib/utilsScreen.dart';
import 'package:amge/widgets/redefinirWidget.dart';
import 'package:flutter/material.dart';

UtilsScreen screen = UtilsScreen.getInstance();

class CadastroScreen extends StatelessWidget {
  CadastroScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: _CadastroScreen(),
    );
  }
}

class _CadastroScreen extends StatefulWidget {
  _CadastroScreen({
    Key key,
  }) : super(key: key);

  @override
  __CadastroScreenState createState() => __CadastroScreenState();
}

class __CadastroScreenState extends State<_CadastroScreen> {
  TextEditingController txtUsuarioController = TextEditingController();
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtSenhaController = TextEditingController();
  TextEditingController txtConfirmaSenhaController = TextEditingController();
  ControllerUser ctrlUsuario = ControllerUser();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: cadastroScreen(),
        ),
      ),
    );
  }

  Container cadastroScreen() {
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
          logotipo(50.0, 30.0),
          formUsuario(),
          formEmail(),
          formSenha(),
          formConfirmaSenha(),
          forgetSenha(),
          btnPadrao(),
          new Expanded(
            child: Divider(),
          ),
          bottomTextPop(),
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

  Widget formEmail() {
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
              Icons.alternate_email,
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
                labelText: "Email",
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
              onSubmitted: (valor) {},
              controller: txtEmailController,
            ),
          ),
        ],
      ),
    );
  }

  Widget formUsuario() {
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
              onSubmitted: (valor) {},
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
              onSubmitted: (valor) {},
              controller: txtSenhaController,
            ),
          ),
        ],
      ),
    );
  }

  Widget formConfirmaSenha() {
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
                labelText: "Confirmar Senha",
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
              onSubmitted: (valor) {},
              controller: txtConfirmaSenhaController,
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
                      return RedefinirSenha(
                        screenParameters: screen,
                      );
                    })
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
    bool cadastrou;
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
                  cadastrou = ctrlUsuario.cadastraUsuario(
                    txtUsuarioController.text,
                    txtEmailController.text,
                    txtSenhaController.text,
                  ),
                  if (cadastrou)
                    {
                      Navigator.maybePop(context),
                    }
                  else
                    {}
                },
                child: Text(
                  "Cadastrar",
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

  Widget bottomTextPop() {
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
                Navigator.maybePop(
                  this.context,
                ),
              },
              child: Text(
                "Já Cadastrado? \nClique aqui e volte para Logar! :)",
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
