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

}