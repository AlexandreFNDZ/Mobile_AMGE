import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:amge/model/usuario.dart';
import 'package:http/http.dart' as http;

class ControllerUser {
  static ControllerUser ctrlUserInstance;

  factory ControllerUser() {
    ctrlUserInstance ??= ControllerUser.constructor();

    return ctrlUserInstance;
  }

  String email;
  String usuario;
  String senha;
  http.Response respostaUserGet;

  ControllerUser.constructor();

  validaLogin(String pUsuario, String pSenha) async {
    String url = "http://143.106.241.1/cl18463/tcc/api/usuario/validar/$pUsuario/$pSenha";
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
        print("Not Usuario");
        return false;
      }
      
    } else {
      print("not Sucesso");
      return false;
    }

    if ((pUsuario == this.usuario) && (md5.convert(utf8.encode(pSenha)).toString() == this.senha)) {
      print("validou!");
      return true;
    }

    print("não validou!");
    return false;
  }

  bool buscaUsuByEmail(String email) {
    if (email == this.email) {
      return true;
    }

    return false;
  }

  bool redefineSenha(String email, String senha) {
    /* Retorno da API para o UPDATE do usuario */
    return true;
  }

  bool cadastraUsuario(String usuario, String email, String senha) {
    Usuario usu = new Usuario(email, usuario, senha);

    if (/*retorno API cadastro no banco*/ usu != null) {
      return true;
    }

    return false;
  }

}