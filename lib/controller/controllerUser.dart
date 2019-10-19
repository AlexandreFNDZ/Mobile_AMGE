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

  bool cadastraUsuario(String usuario, String email, String senha) {
    Usuario usu = new Usuario(email, usuario, senha);

    if (/*retorno API cadastro no banco*/ usu != null) {
      return true;
    }

    return false;
  }

}