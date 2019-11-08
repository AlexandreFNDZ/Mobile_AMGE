import 'dart:convert';
import 'package:amge/controller/controllerUser.dart';
import 'package:amge/model/userEvents.dart';
import 'package:amge/model/usuario.dart';
import 'package:http/http.dart' as http;

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


  Future<List<UserEvents>> getEventos() async {
    usu = Usuario.ctrlUserInstance;
    int idUsuario = int.parse(usu.codigo);

    http.Response resposta = await http.get(url + "eventPers/buscar/$idUsuario");
    var dadosJson = json.decode(resposta.body);

    List<UserEvents> lista = List();

    if (dadosJson["status"].toString() == "Sucesso") {
      for (var event in dadosJson["dados"]) {
        UserEvents evento = UserEvents.constructor(int.parse(event["codigo"]),event["titulo"],event["data_ini"],event["data_fim"],event["descricao"],int.parse(event["cod_user"]),int.parse(event["cod_local"]),event["cor"]);
        lista.add(evento);
      }

    }

    return lista;
  } 

  Future<List<UserEvents>> getEventosHoje() async {
    usu = Usuario.ctrlUserInstance;
    int idUsuario = int.parse(usu.codigo);

    http.Response resposta = await http.get(url + "eventPers/buscar/$idUsuario");
    var dadosJson = json.decode(resposta.body);

    List<UserEvents> lista = List();

    if (dadosJson["status"].toString() == "Sucesso") {
      for (var event in dadosJson["dados"]) {
        DateTime dataHoje = DateTime.parse(event["data_ini"]);
        if (dataHoje.difference(DateTime.now()).inDays == 0) {
          UserEvents evento = UserEvents.constructor(int.parse(event["codigo"]),event["titulo"],event["data_ini"],event["data_fim"],event["descricao"],int.parse(event["cod_user"]),int.parse(event["cod_local"]),event["cor"]);
          lista.add(evento);
        }
      }

    }

    return lista;
  } 

  Future<List<UserEvents>> getProxEventos() async {
    usu = Usuario.ctrlUserInstance;
    int idUsuario = int.parse(usu.codigo);

    http.Response resposta = await http.get(url + "eventPers/buscar/$idUsuario");
    var dadosJson = json.decode(resposta.body);

    List<UserEvents> lista = List();

    if (dadosJson["status"].toString() == "Sucesso") {
      for (var event in dadosJson["dados"]) {
        DateTime dataHoje = DateTime.parse(event["data_ini"]);
        if (dataHoje.difference(DateTime.now()).inDays == 1 || dataHoje.difference(DateTime.now()).inDays == 2) {
          UserEvents evento = UserEvents.constructor(int.parse(event["codigo"]),event["titulo"],event["data_ini"],event["data_fim"],event["descricao"],int.parse(event["cod_user"]),int.parse(event["cod_local"]),event["cor"]);
          lista.add(evento);
        }
      }

    }

    return lista;
  }

  insereEvento(String titulo, String dataIni, String dataFim, String descricao, String cep) async {
    usu = Usuario.ctrlUserInstance;
    int idUsuario = int.parse(usu.codigo);
    String retorno;
    String url = "http://143.106.241.1/cl18463/tcc/api/EventPers/inserir/$titulo/$dataIni/$dataFim/$descricao/$idUsuario/$cep";

    http.Response resposta = await http.get(url);
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