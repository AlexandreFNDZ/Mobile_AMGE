class UserEvents {

  int _codigo;
  String _titulo;
  String _dataIni;
  String _dataFim;
  String _descricao;
  int _codUser;
  int _codLocal;
  String _cor;

	int getCodigo() {
		return this._codigo;
	}
	void setCodigo(int _codigo) {
		this._codigo = _codigo;
	}

	String getTitulo() {
		return this._titulo;
	}
	void setTitulo(String _titulo) {
		this._titulo = _titulo;
	}

	String getDataIni() {
		return this._dataIni;
	}
	void setDataIni(String _dataIni) {
		this._dataIni = _dataIni;
	}

	String getDataFim() {
		return this._dataFim;
	}
	void setDataFim(String _dataFim) {
		this._dataFim = _dataFim;
	}

	String getDescricao() {
		return this._descricao;
	}
	void setDescricao(String _descricao) {
		this._descricao = _descricao;
	}

	int getCodUser() {
		return this._codUser;
	}
	void setCodUser(int _codUser) {
		this._codUser = _codUser;
	}

	int getCodLocal() {
		return this._codLocal;
	}
	void setCodLocal(int _codLocal) {
		this._codLocal = _codLocal;
	}

	String getCor() {
		return this._cor;
	}
	void setCor(String _cor) {
		this._cor = _cor;
	}


  UserEvents.constructor(pCodigo,pTitulo,pDataIni,pDataFim,pDescricao,pCodUser,pCodLocal,pCor) {
    setCodigo(pCodigo);
    setTitulo(pTitulo);
    setDataIni(pDataIni);
    setDataFim(pDataFim);
    setDescricao(pDescricao);
    setCodUser(pCodUser);
    setCodLocal(pCodLocal);
    setCor(pCor);
  }

}