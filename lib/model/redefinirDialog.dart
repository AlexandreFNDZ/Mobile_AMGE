import 'package:amge/controller/controllerUser.dart';
import 'package:amge/external_lib/utilsScreen.dart';
import 'package:flutter/material.dart';

class RedefinirSenha {
  String _email;
  String _senha;
  String _confirmaSenha;

  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtSenhaController = TextEditingController();
  TextEditingController txtConfirmaSenhaController = TextEditingController();
  ControllerUser ctrlUsuario = ControllerUser();

  String get email {
    return _email;
  }

  set email(String email) {
    this._email = email;
  }

  String get senha {
    return _senha;
  }

  set senha(String senha) {
    this._senha = senha;
  }

  String get confirmaSenha {
    return _confirmaSenha;
  }

  set confirmaSenha(String confirmaSenha) {
    this._confirmaSenha = confirmaSenha;
  }

  RedefinirSenha();
  RedefinirSenha.constructor(pEmail, pSenha, pConfirma) {
    email = pEmail;
    senha = pSenha;
    confirmaSenha = pConfirma;
  }

  AlertDialog confirmaScreen(BuildContext context, UtilsScreen screen) {
    Widget formEmail() {
      return Container(
        width: MediaQuery.of(context).size.width,
        // margin: const EdgeInsets.only(left: 40.0, right: 40.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: screen.backgroundColor1,
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
                color: screen.backgroundColor1,
              ),
            ),
            new Expanded(
              child: TextField(
                style: TextStyle(
                  color: screen.backgroundColor1,
                  fontFamily: 'VT323',
                  fontSize: 35,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: screen.backgroundColor1,
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

    Widget formSenha() {
      return Container(
        width: MediaQuery.of(context).size.width,
        // margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: screen.backgroundColor1,
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
                color: screen.backgroundColor1,
              ),
            ),
            new Expanded(
              child: TextField(
                obscureText: true,
                style: TextStyle(
                  color: screen.backgroundColor1,
                  fontFamily: 'VT323',
                  fontSize: 35,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: screen.backgroundColor1,
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
        width: MediaQuery.of(context).size.width,
        // margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: screen.backgroundColor1,
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
                color: screen.backgroundColor1,
              ),
            ),
            new Expanded(
              child: TextField(
                obscureText: true,
                style: TextStyle(
                  color: screen.backgroundColor1,
                  fontFamily: 'VT323',
                  fontSize: 35,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Confirmar Senha",
                  labelStyle: TextStyle(
                    color: screen.backgroundColor1,
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
      bool atualizou;
      return Container(
        padding: EdgeInsets.only(top: 50),
        width: MediaQuery.of(context).size.width,
        // margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 8.0),
        alignment: Alignment.center,
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Container(
                child: new FlatButton(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  color: screen.backgroundColor1,
                  onPressed: () => {
                    atualizou = ctrlUsuario.redefineSenha(
                      txtEmailController.text,
                      txtSenhaController.text,
                    ),
                    if (atualizou)
                      {
                        Navigator.maybePop(context),
                      }
                    else
                      {}
                  },
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(
                      color: screen.foregroundColor,
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

    return AlertDialog(
      title: Text("Redefinir Senha"),
      titlePadding: EdgeInsets.all(20),
      content: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            formEmail(),
            formSenha(),
            formConfirmaSenha(),
            btnPadrao(),
          ],
        ),
      ),
    );
  }
}
