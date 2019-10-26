import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:amge/model/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ControllerUser {
  static ControllerUser ctrlUserInstance;

  factory ControllerUser() {
    ctrlUserInstance ??= ControllerUser.constructor();

    return ctrlUserInstance;
  }

  var snack;
  String email;
  String usuario;
  String senha;
  http.Response respostaUserGet;

  ControllerUser.constructor();

  validaLogin(String pUsuario, String pSenha) async {
    String retorno;
    String url = "http://143.106.241.1/cl18463/tcc/api/usuario/buscar/$pUsuario/$pSenha";
    respostaUserGet = await http.get(url);
    Map<String, dynamic> obj = json.decode(respostaUserGet.body);

    if (obj["status"].toString() == "Sucesso") {
      List<dynamic> objectUsu = obj["dados"].map((i)=>Usuario.fromJson(i)).toList();
      print(objectUsu.length);

      if (objectUsu.length == 1) { 
        Usuario user = objectUsu.elementAt(0);
        
        this.email = user.email;
        this.usuario = user.usuario;
        this.senha = user.senha;
      } else {
        retorno = "Usuário não encontrado!";
      }
      
    } else {
      retorno = "Erro de Conexão, tente mais tarde!";
    }
    print(pUsuario);
    print(md5.convert(utf8.encode(pSenha)).toString());
    if ((pUsuario == this.usuario) && (md5.convert(utf8.encode(pSenha)).toString() == this.senha)) {
      retorno = "OK";
    } else {
      retorno = "Usuário e/ou Senha Inválida!";
    }

    return retorno;
  }

  bool buscaUsuByEmail(String email) {
    //http://143.106.241.1/cl18463/tcc/api/usuario/inserir/
    if (email == this.email) {
      return true;
    }

    return false;
  }

  redefineSenha(String pEmail, String pSenha) async {
    String retorno;
    String url = "http://143.106.241.1/cl18463/tcc/api/usuario/redefinir/$pEmail/$pSenha";
    respostaUserGet = await http.get(url);
    Map<String, dynamic> obj = json.decode(respostaUserGet.body);
    // bad requeste,, replace " " por "%20"
    //http://143.106.241.1/cl18463/tcc/api/usuario/inserir/ -nome- / -usuario- / -email- / -senha- / -telefone-
    if (obj["status"].toString() == "Sucesso") {
      String atualizou = obj["dados"].toString();

      if (atualizou == "true") {
        retorno = "OK";
      } else {
        retorno = "Email não encontrado!";
      }
      
    } else {
      retorno = "Erro de Conexão! Tente novamente mais tarde!";
    }

    return retorno;
  }

  cadastraUsuario(String pNome, String pUsuario, String pEmail, String pSenha) async {
    String retorno;
    Usuario usu = new Usuario(email, usuario, senha);
    String url = "http://143.106.241.1/cl18463/tcc/api/usuario/inserir/$pNome/$pUsuario/$pEmail/$pSenha";
    respostaUserGet = await http.get(url);
    Map<String, dynamic> obj = json.decode(respostaUserGet.body);
    // bad requeste,, replace " " por "%20"
    //http://143.106.241.1/cl18463/tcc/api/usuario/inserir/ -nome- / -usuario- / -email- / -senha- / -telefone-
    if (obj["status"].toString() == "Sucesso") {
      String inseriu = obj["dados"].toString();

      if (inseriu == "true") {
        retorno = "OK";
      } else {
        retorno = "Usuario ou email já Cadastrado!";
      }
      
    } else {
      retorno = "Erro de Conexão! Tente novamente mais tarde!";
    }

    return retorno;
  }

}