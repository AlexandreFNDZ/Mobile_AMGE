import 'package:flutter/material.dart';

class CadastroEventos extends StatefulWidget {
  @override
  _CadastroEventosState createState() => _CadastroEventosState();
}

class _CadastroEventosState extends State<CadastroEventos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Novo Evento"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Text("novo evento"),
            ),
            Expanded(
              child: Text("novo evento"),
            ),
            Expanded(
              child: Text("novo evento"),
            ),
          ],
        ),
      ),
    );
  }
}
