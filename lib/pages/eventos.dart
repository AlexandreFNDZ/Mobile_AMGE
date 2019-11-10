
import 'package:amge/controller/controllerUser.dart';
import 'package:amge/model/userEvents.dart';
import 'package:amge/controller/controllerEvents.dart';
import 'package:amge/model/usuario.dart';
import 'package:flutter/material.dart';

class Eventos extends StatefulWidget {
  @override
  _EventosState createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  double fontSizeMenor = 30;
  double fontSizeMaior = 50;
  double divisorMenor = 5.5;
  double divisorMaior = 4;
  double heightMenor = 80;
  double heightMaior = 100;

  Usuario usu = Usuario.ctrlUserInstance;

  var diaSemana = ["SEG", "TER", "QUA", "QUI", "SEX", "SAB", "DOM"];
  int hojeDay = (DateTime.now().subtract(Duration(days: 1)).weekday);

  var eventos;

  ControllerEvents ctrlEvento = ControllerEvents();
  ControllerUser ctrlUser = ControllerUser();

  @override
  Widget build(BuildContext context) {
    print(usu.codigo);
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black26),
                width: (MediaQuery.of(context).size.width / divisorMenor),
                height: heightMenor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      diaSemana[getDiaCerto((hojeDay) - 2)].toString(),
                      style: TextStyle(color: Colors.white60),
                    ),
                    Text(
                      DateTime.now().subtract(Duration(days: 2)).day.toString(),
                      style: TextStyle(
                        fontSize: fontSizeMenor,
                        color: Colors.white60,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black26),
                width: (MediaQuery.of(context).size.width / divisorMenor),
                height: heightMenor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      diaSemana[getDiaCerto((hojeDay) - 1)].toString(),
                      style: TextStyle(color: Colors.white60),
                    ),
                    Text(
                      DateTime.now().subtract(Duration(days: 1)).day.toString(),
                      style: TextStyle(
                          fontSize: fontSizeMenor, color: Colors.white60),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                width: (MediaQuery.of(context).size.width / divisorMaior),
                height: heightMaior,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(diaSemana[getDiaCerto(hojeDay)].toString()),
                    Text(
                      DateTime.now().day.toString(),
                      style: TextStyle(fontSize: fontSizeMaior),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white60),
                width: (MediaQuery.of(context).size.width / divisorMenor),
                height: heightMenor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      diaSemana[getDiaCerto((hojeDay) + 1)].toString(),
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(
                      DateTime.now().add(Duration(days: 1)).day.toString(),
                      style: TextStyle(
                          fontSize: fontSizeMenor, color: Colors.blue),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white60),
                width: (MediaQuery.of(context).size.width / divisorMenor),
                height: heightMenor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      diaSemana[getDiaCerto((hojeDay) + 2)].toString(),
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(
                      DateTime.now().add(Duration(days: 2)).day.toString(),
                      style: TextStyle(
                          fontSize: fontSizeMenor, color: Colors.blue),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 30,
              height: 250,
              decoration: BoxDecoration(color: Colors.black),
              child: RotatedBox(
                quarterTurns: 135,
                child: Center(
                  child: Text(
                    "EVENTOS  DE  HOJE",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 30),
              height: 250,
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.black, width: 1),
                color: Colors.white,
              ),
              child: Center(
                child: FutureBuilder<List<UserEvents>>(
                  future: ctrlEvento.getEventosHoje(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return Text("Houve um erro ao Carregar");
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              List<UserEvents> lista = snapshot.data;
                              UserEvents evento = lista[index];

                              return ListTile(
                                leading: Icon(Icons.local_activity, size: 45, color: Colors.black,),
                                title: Text(
                                  evento.getTitulo(),
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  evento.getDataIni(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              );
                            },
                          );
                        }
                        break;
                    }

                    return Text("Erro fora do Switch");
                  },
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white60,
                ),
                child: Center(
                  child: Text(
                    "PRÓXIMOS  EVENTOS",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40, bottom: 20),
                width: MediaQuery.of(context).size.width,
                // constraints: BoxConstraints(maxHeight: 350, minHeight: 200),
                height: 272,
                child: Center(
                  child: FutureBuilder<List<UserEvents>>(
                    future: ctrlEvento.getProxEventos(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                          break;
                        case ConnectionState.active:
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return Text("Houve um erro ao Carregar");
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                List<UserEvents> lista = snapshot.data;
                                UserEvents evento = lista[index];

                                return ListTile(
                                  onTap: () => print(evento.getCodigo().toString()),
                                  leading: Icon(Icons.timeline, size: 35, color: Colors.white,),
                                  title: Text(
                                    evento.getTitulo(),
                                    style: TextStyle(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    evento.getDataIni(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          break;
                      }

                      return Text("Erro fora do Switch");
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  getDiaCerto(int dia) {
    if (dia < 0) {
      dia += 7;
    } else if (dia > 6) {
      dia -= 7;
    }

    return dia;
  }
}
