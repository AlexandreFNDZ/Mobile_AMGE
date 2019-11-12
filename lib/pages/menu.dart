import 'dart:io';

import 'package:amge/main.dart';
import 'package:amge/model/usuario.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Usuario usuario = Usuario.ctrlUserInstance;
  String urlImage =
      "http://143.106.241.1/cl18463/tcc/files/views/agenda/imgUser/";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        body: new Stack(
          children: <Widget>[
            ClipPath(
              child: Container(color: Colors.blueAccent),
              clipper: GetClipper(),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height / 5,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: NetworkImage(urlImage + usuario.foto),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(75.0)),
                      boxShadow: [
                        BoxShadow(blurRadius: 7.0, color: Colors.black)
                      ],
                    ),
                  ),
                  SizedBox(height: 90.0),
                  Text(
                    usuario.nome,
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    usuario.email,
                    style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Roboto'),
                  ),
                  SizedBox(height: 70.0),
                  // Container(
                  //   height: 45.0,
                  //   width: 95.0,
                  //   child: Material(
                  //     borderRadius: BorderRadius.circular(20.0),
                  //     shadowColor: Colors.black,
                  //     color: Colors.blue,
                  //     elevation: 7.0,
                  //     child: GestureDetector(
                  //       onTap: () {},
                  //       child: Center(
                  //         child: Text(
                  //           'Editar Nome',
                  //           style: TextStyle(
                  //               color: Colors.white, fontFamily: 'Roboto'),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 25.0),
                  Container(
                    height: 45.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.black,
                      color: Colors.blue,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        },
                        child: Center(
                          child: Text(
                            'Sair',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Roboto'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
