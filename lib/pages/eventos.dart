import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  var diaSemana = ["SEG", "TER", "QUA", "QUI", "SEX", "SAB", "DOM"];
  int hojeDay = (DateTime.now().subtract(Duration(days: 1)).weekday);

  var eventos;

  @override
  Widget build(BuildContext context) {
    print(getDiaCerto((hojeDay) - 2));
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("EVENTO 1"),
                    Text("EVENTO 2"),
                    Text("EVENTO 3")
                  ],
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
                width: MediaQuery.of(context).size.width,
                height: 272,
                child: ListView(
                  children: <Widget>[
                    Text("EVENTO A"),
                    Text("EVENTO B"),
                    Text("EVENTO C"),
                    Text("EVENTO A"),
                    Text("EVENTO B"),
                    Text("EVENTO C"),
                    Text("EVENTO A"),
                    Text("EVENTO B"),
                    Text("EVENTO C"),
                    Text("EVENTO A"),
                    Text("EVENTO B"),
                    Text("EVENTO C"),
                    Text("EVENTO A"),
                    Text("EVENTO B"),
                    Text("EVENTO C"),
                    Text("EVENTO A"),
                    Text("EVENTO B"),
                    Text("EVENTO C"),
                    Text("EVENTO A"),
                    Text("EVENTO B"),
                    Text("EVENTO C"),
                    Text("EVENTO A"),
                    Text("EVENTO B"),
                    Text("EVENTO C")
                  ],
                ),
              )
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
