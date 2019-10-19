import 'package:amge/controller/controllerUser.dart';
import 'package:amge/external_lib/utilsScreen.dart';
import 'package:flutter/material.dart';

UtilsScreen screen = UtilsScreen.getInstance();

class RedefinirScreen extends StatelessWidget {
  RedefinirScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: _RedefinirScreen(),
      backgroundColor: Colors.transparent,
    );
  }
}

class _RedefinirScreen extends StatefulWidget {
  _RedefinirScreen({
    Key key,
  }) : super(key: key);

  @override
  __RedefinirScreen createState() => __RedefinirScreen();
}

class __RedefinirScreen extends State<_RedefinirScreen> {
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtSenhaController = TextEditingController();
  TextEditingController txtConfirmaSenhaController = TextEditingController();
  ControllerUser ctrlUsuario = ControllerUser();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      
      padding: EdgeInsets.only(top: 70, bottom: 70, right: 30, left: 30),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: redefinirScreen(),
          ),
        ),
      ),
    );
  }

  Container redefinirScreen() {
    return Container(
      height: MediaQuery.of(context).size.height - 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color.fromRGBO(50, 50, 255, 0.6),
      ),
      child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              formEmail(),
              formSenha(),
              formConfirmaSenha(),
              btnPadrao(),
            ],
          ),
        ),
      ),
    );
  }

  Widget formEmail() {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
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
              onSubmitted: (valor) {
                txtEmailController.text = valor;
              },
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
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget formSenha() {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
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

  Widget formConfirmaSenha() {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
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
              onSubmitted: (valor) {
                txtConfirmaSenhaController.text = valor;
              },
              controller: txtConfirmaSenhaController,
            ),
          ),
        ],
      ),
    );
  }

  Widget btnPadrao() {
    bool redefiniu;
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 100.0),
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
                  if (ctrlUsuario.buscaUsuByEmail(txtEmailController.text)) {
                    redefiniu = ctrlUsuario.redefineSenha(txtEmailController.text,txtSenhaController.text),

                    if (redefiniu) {
                      Navigator.maybePop(context),
                    } else {
                      /* Toast de erro de cadastro */
                    }
                  }
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
}
