class Usuario {
  static Usuario ctrlUserInstance;

  factory Usuario(pEmail, pUsuario, pSenha, {pCod}) {
    ctrlUserInstance ??= Usuario.constructor(pEmail, pUsuario, pSenha,pCod: pCod);

    return ctrlUserInstance;
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return new Usuario(json['email'].toString(),json['usuario'],json['senha'],pCod: json['codigo']);
  }
  
  String _email;
  String _usuario;
  String _senha;
  String _codigo;

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

  String get codigo {
    return _codigo;
  }
  set codigo(String codigo) {
    this._codigo = codigo;
  }

  Usuario.constructor(pEmail, pUsuario, pSenha, {pCod}) {
    email = pEmail;
    usuario = pUsuario;
    senha = pSenha;
    codigo = pCod;
  }

}