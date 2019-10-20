class Usuario {
  static Usuario ctrlUserInstance;

  factory Usuario(pEmail, pUsuario, pSenha) {
    ctrlUserInstance ??= Usuario.constructor(pEmail, pUsuario, pSenha);

    return ctrlUserInstance;
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return new Usuario(json['email'].toString(),json['usuario'],json['senha'],);
  }
  
  String _email;
  String _usuario;
  String _senha;

  String get email {
    return _email;
  }
  set email(String email) {
    this._email = email;
  }

  String get usuario {
    return _usuario;
  }
  set usuario(String usuario) {
    this._usuario = usuario;
  }

  String get senha {
    return _senha;
  }
  set senha(String senha) {
    this._senha = senha;
  }

  Usuario.constructor(pEmail, pUsuario, pSenha) {
    email = pEmail;
    usuario = pUsuario;
    senha = pSenha;
  }

}