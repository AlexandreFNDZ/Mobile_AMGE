class Usuario {
  static Usuario ctrlUserInstance;

  factory Usuario(pEmail, pUsuario, pSenha, pNome, {pFoto, pCod}) {
    ctrlUserInstance ??= Usuario.constructor(pEmail, pUsuario, pSenha, pNome, pFoto: pFoto, pCod: pCod);

    return ctrlUserInstance;
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return new Usuario(json['email'].toString(),json['usuario'],json['senha'], json['nome'], pFoto: json['foto'], pCod: json['codigo']);
  }
  
  String _email;
  String _usuario;
  String _senha;
  String _codigo;
  String _nome;
  String _foto;

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

  String get nome {
    return _nome;
  }
  set nome(String nome) {
    this._nome = nome;
  }

  String get foto {
    return _foto;
  }
  set foto(String foto) {
    this._foto = foto;
  }

  Usuario.constructor(pEmail, pUsuario, pSenha, pNome, {pFoto, pCod}) {
    email = pEmail;
    usuario = pUsuario;
    senha = pSenha;
    codigo = pCod;
    nome = pNome;
    foto = pFoto;
  }

  static void clearInstance() {
    ctrlUserInstance = null;
  }

}