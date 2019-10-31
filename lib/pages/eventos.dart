import 'package:flutter/material.dart';

class Eventos extends StatefulWidget {
  @override
  _EventosState createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Text(
          "EVENTOS",
          style: TextStyle(color: Colors.blue, fontSize: 50),
        ),
      ),
    );
  }
}