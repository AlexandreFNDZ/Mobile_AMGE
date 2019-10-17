import 'package:flutter/material.dart';

class UtilsScreen {
  static UtilsScreen instance;

  factory UtilsScreen(Color backgroundColor1,
    Color backgroundColor2,
    Color highlightColor,
    Color foregroundColor,
    AssetImage logo,
    BuildContext context) {

    instance ??= UtilsScreen.construtor(backgroundColor1,
    backgroundColor2,
    highlightColor,
    foregroundColor,
    logo,
    context);
    
    return instance;

  }

  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color highlightColor;
  final Color foregroundColor;
  final AssetImage logo;
  final BuildContext context;

  UtilsScreen.construtor(
      this.backgroundColor1,
      this.backgroundColor2,
      this.highlightColor,
      this.foregroundColor,
      this.logo,
      this.context);

  Widget logotipo() {
    return Container(
      padding: const EdgeInsets.only(top: 100.0, bottom: 100.0),
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
                image: DecorationImage(image: this.logo),
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

  Widget formPadrao(IconData formIcone, String txtLabel) {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: this.foregroundColor,
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
              formIcone,
              color: this.foregroundColor,
            ),
          ),
          new Expanded(
            child: TextField(
              style: TextStyle(
                color: this.foregroundColor,
                fontFamily: 'VT323',
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: txtLabel,
                labelStyle: TextStyle(
                  color: this.foregroundColor,
                  fontFamily: 'Roboto',
                  fontSize: 18,
                ),
                contentPadding: EdgeInsets.only(left: 20),
                border: InputBorder.none,
                //hintText: 'Nome de usuário',
                //hintStyle: TextStyle(color: this.foregroundColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget formSenha(String txtSenha) {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: this.foregroundColor,
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
              color: this.foregroundColor,
            ),
          ),
          new Expanded(
            child: TextField(
              obscureText: true,
              style: TextStyle(
                color: this.foregroundColor,
                fontFamily: 'VT323',
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: txtSenha,
                labelStyle: TextStyle(
                  color: this.foregroundColor,
                  fontFamily: 'Roboto',
                  fontSize: 18,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
                //hintText: 'Senha',
                //hintStyle: TextStyle(color: this.foregroundColor),
              ),
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
              onPressed: () => {},
              child: Text(
                "Esqueceu a senha?",
                textAlign: TextAlign.end,
                style: TextStyle(color: this.foregroundColor.withOpacity(0.8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget btnPadrao(String textoBtn, StatelessWidget tela) {
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
                color: this.foregroundColor,
                onPressed: () => {
                  Navigator.push(
                    this.context,
                    MaterialPageRoute(
                      builder: (context) => tela
                      )
                  )
                },
                child: Text(
                  textoBtn,
                  style: TextStyle(
                    color: this.backgroundColor2,
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

  Widget bottomText(String textoBtn) {
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
              onPressed: () => {},
              child: Text(
                textoBtn,
                style: TextStyle(color: this.foregroundColor.withOpacity(0.5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
