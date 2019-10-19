import 'package:amge/model/usuario.dart';

class ControllerUser {
  static ControllerUser ctrlUserInstance;

  factory ControllerUser() {
    ctrlUserInstance ??= ControllerUser.constructor();

    return ctrlUserInstance;
  }

  String email = "usuario@gmail.com";
  String usuario = "usuario";
  String senha = "123";

  ControllerUser.constructor();

  bool validaLogin(String usuario, String senha) {
    if ((usuario == this.usuario) && (senha == this.senha)) {
      return true;
    }

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

}