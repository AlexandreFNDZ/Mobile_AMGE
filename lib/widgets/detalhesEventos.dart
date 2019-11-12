import 'package:amge/controller/controllerEvents.dart';
import 'package:amge/model/userEvents.dart';
import 'package:flutter/material.dart';

class DetalhesEventos extends StatefulWidget {
  final UserEvents event;
  DetalhesEventos({this.event});
  @override
  _DetalhesEventosState createState() => _DetalhesEventosState(this.event);
}

class _DetalhesEventosState extends State<DetalhesEventos> {
  ControllerEvents ctrlEvent = ControllerEvents.ctrlEventsInstance;
  UserEvents event;
  String excluiu = "";

  _DetalhesEventosState(UserEvents pEvent) {
    this.event = pEvent;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Detalhes"),
      titlePadding: EdgeInsets.all(20),
      content: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Título: " + event.getTitulo(),
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 25),
            Row(
              children: <Widget>[
                Text("Descrição: ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                Text(event.getDescricao(), style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                Text("Início: ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                Text(event.getDataIni(), style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Fim: ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                Text(event.getDataFim(), style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Builder(
                  builder: (newContext) => FlatButton(
                    onPressed: () async {
                      String retorno = await ctrlEvent.excluiEvento(event.getCodigo());

                      if (retorno == "OK") {
                        setState(() {
                          excluiu = "Evento deletado com Sucesso!";
                        });
                        await new Future.delayed(const Duration(seconds: 2));
                        Navigator.pop(newContext);

                      } else {
                        setState(() {
                          excluiu = retorno;
                        });

                        await new Future.delayed(const Duration(seconds: 2));

                        setState(() {
                          excluiu = "";
                        });
                      }
                      
                    },
                    child: Text(
                      "Excluir",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.redAccent,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                  child: Text(
                    "Sair",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                )
              ],
            ),
            SizedBox(
              height: 25,
              child: Center(child: Text(excluiu, style: TextStyle(color: Colors.blue),)),
            ),
          ],
        ),
      ),
    );
  }
}
