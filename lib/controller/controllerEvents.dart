import 'dart:convert';
import 'package:amge/model/userEvents.dart';
import 'package:amge/model/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ControllerEvents {
  static ControllerEvents ctrlEventsInstance;

  static Usuario usu;
  factory ControllerEvents() {
    ctrlEventsInstance ??= ControllerEvents.constructor();

    return ctrlEventsInstance;
  }

  String url = "http://143.106.241.1/cl18463/tcc/api/";
  // http://143.106.241.1/cl18463/tcc/api/eventPers/buscar/1

  ControllerEvents.constructor();


  Map<DateTime, List<UserEvents>> getMapEvents(List<UserEvents> eventos) {
    Map<DateTime, List<UserEvents>> _events = new Map<DateTime, List<UserEvents>>();
    List<DateTime> listaDatas = [];
    
    bool existeData;
    
    for (var event in eventos) {
      existeData = false;
      String dataFormatada = DateFormat("yyyy-MM-dd").format(DateTime.parse(event.getDataIni()));
      for (var data in listaDatas) {
        if (DateFormat("yyyy-MM-dd").format(data) == dataFormatada) {
          existeData = true;
        }
      }

      if (!existeData) {
        listaDatas.add(DateTime.parse(dataFormatada));
      }
    }
    print(listaDatas.elementAt(0));

    for (var data in listaDatas) {
      List<UserEvents> listaEventoDia = [];
      print("data = " + data.toString());

      for (var event in eventos) {
        String dataFormatada = DateFormat("yyyy-MM-dd").format(DateTime.parse(event.getDataIni()));

        if (DateFormat("yyyy-MM-dd").format(data) == dataFormatada) {
          listaEventoDia.add(event);
        }
      }

      _events.putIfAbsent(data,() => listaEventoDia);
      print("listaEventoDia " + listaEventoDia.toString());
      print("evento " + _events.toString());
    }

    print("map de eventos?? " + _events.toString());

    return _events;
  }

  Future<List<UserEvents>> getEventos() async {
    usu = Usuario.ctrlUserInstance;
    int idUsuario = int.parse(usu.codigo);

    http.Response resposta =
        await http.get(url + "eventPers/buscar/$idUsuario");
    var dadosJson = json.decode(resposta.body);

    List<UserEvents> lista = List();

    if (dadosJson["status"].toString() == "Sucesso") {
      for (var event in dadosJson["dados"]) {
        UserEvents evento = UserEvents.constructor(
            int.parse(event["codigo"]),
            event["titulo"],
            event["data_ini"],
            event["data_fim"],
            event["descricao"],
            int.parse(event["cod_user"]),
            int.parse(event["cep"]),
            event["cor"]);
        lista.add(evento);
      }
    }

    return lista;
  }

  Future<List<UserEvents>> getEventosHoje() async {
    usu = Usuario.ctrlUserInstance;
    int idUsuario = int.parse(usu.codigo);

    http.Response resposta =
        await http.get(url + "eventPers/buscar/$idUsuario");
    var dadosJson = json.decode(resposta.body);
    print(dadosJson.toString());
    List<UserEvents> lista = List();

    if (dadosJson["status"].toString() == "Sucesso") {
      for (var event in dadosJson["dados"]) {
        DateTime dataHoje = DateTime.parse(event["data_ini"]);
        if (dataHoje.day == DateTime.now().day) {
          UserEvents evento = UserEvents.constructor(
              int.parse(event["codigo"]),
              event["titulo"],
              event["data_ini"],
              event["data_fim"],
              event["descricao"],
              int.parse(event["cod_user"]),
              int.parse(event["cep"]),
              event["cor"]);
          print(evento.getTitulo());
          lista.add(evento);
        }
      }
    }

    lista.sort((a, b) {
      var adate = a.getDataIni();
      var bdate = b.getDataIni();
      return adate.compareTo(bdate);
    });

    return lista;
  }

  Future<List<UserEvents>> getProxEventos() async {
    usu = Usuario.ctrlUserInstance;
    int idUsuario = int.parse(usu.codigo);

    http.Response resposta =
        await http.get(url + "EventPers/buscar/$idUsuario");
    var dadosJson = json.decode(resposta.body);

    List<UserEvents> lista = List();

    if (dadosJson["status"].toString() == "Sucesso") {
      for (var event in dadosJson["dados"]) {
        DateTime dataHoje = DateTime.parse(event["data_ini"]);
        //DateTime diaHoje = DateTime.parse(event["data_ini"]).day as DateTime;
        if (dataHoje.subtract(Duration(days: 1)).day == DateTime.now().day ||
            dataHoje.subtract(Duration(days: 2)).day == DateTime.now().day) {
          UserEvents evento = UserEvents.constructor(
              int.parse(event["codigo"]),
              event["titulo"],
              event["data_ini"],
              event["data_fim"],
              event["descricao"],
              int.parse(event["cod_user"]),
              int.parse(event["cep"]),
              event["cor"]);
          lista.add(evento);
        }
      }
    }

    lista.sort((a, b) {
      var adate = a.getDataIni();
      var bdate = b.getDataIni();
      return adate.compareTo(bdate);
    });

    return lista;
  }

  insereEvento(String titulo, String dataIni, String dataFim, String descricao,
      String cep) async {
    usu = Usuario.ctrlUserInstance;
    int idUsuario = int.parse(usu.codigo);
    String retorno;
    String url =
        "http://143.106.241.1/cl18463/tcc/api/EventPers/inserir/$titulo/$dataIni/$dataFim/$descricao/$idUsuario/$cep";

    print(url);
    http.Response resposta = await http.get(url);
    print(resposta.toString());
    Map<String, dynamic> obj = json.decode(resposta.body);

    if (obj["status"].toString() == "Sucesso") {
      String inseriu = obj["dados"].toString();

      if (inseriu == "true") {
        retorno = "OK";
      } else {
        retorno = "Evento já Cadastrado";
      }
    } else {
      retorno = "Erro de Conexão! Tente novamente mais tarde!";
    }

    return retorno;
  }
}
