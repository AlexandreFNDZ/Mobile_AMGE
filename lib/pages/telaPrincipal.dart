import 'package:amge/external_lib/utilsScreen.dart';
import 'package:flutter/material.dart';

UtilsScreen screen = UtilsScreen.getInstance();
int _selectedIndex;

class TelaPrincipal extends StatelessWidget {
  TelaPrincipal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: _TelaPrincipal(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Center(
              child: Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.greenAccent,
            icon: Center(
              child: Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.purple,
            icon: Center(
              child: Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            icon: Center(
              child: Icon(Icons.home),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Center(
              child: Icon(Icons.home),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap:(index){},
      ),
    );
  }
}

class _TelaPrincipal extends StatefulWidget {
  _TelaPrincipal({
    Key key,
  }) : super(key: key);

  @override
  __TelaPrincipal createState() => __TelaPrincipal();
}

class __TelaPrincipal extends State<_TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Text("PAGINA PRINCIPAL"),
          ),
        ),
      ),
    );
  }
}
