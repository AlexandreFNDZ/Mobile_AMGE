import 'package:amge/external_lib/utilsScreen.dart';
import 'package:amge/pages/cadastroEventos.dart';
import 'package:amge/pages/calendar.dart';
import 'package:amge/pages/chat.dart';
import 'package:amge/pages/eventos.dart';
import 'package:amge/pages/menu.dart';
import 'package:flutter/material.dart';

UtilsScreen screen = UtilsScreen.getInstance();
int _selectedIndex = 1;

class TelaPrincipal extends StatefulWidget {
  TelaPrincipal();

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Menu(),
      Eventos(),
      Text("tela 3"),
      Calendar(),
      Chat(),
    ];

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 75,
        height: 75,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CadastroEventos()
                ),
              );
            },
            tooltip: 'Novo Evento',
            child: Icon(Icons.add, size: 40),
            elevation: 2.0,
          ),
        ),
      ),
      resizeToAvoidBottomPadding: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFF6da8ff),
        child: Center(
          child: telas[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            title: Text("Menu"),
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.greenAccent,
            title: Text("Eventos"),
            icon: Icon(
              Icons.event,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.purple,
            title: Text(""),
            icon: Icon(Icons.add, size: 0),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            title: Text("Calendar"),
            icon: Icon(
              Icons.date_range,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            title: Text("Chat"),
            icon: Icon(
              Icons.chat,
              size: 30,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
