import 'package:amge/controller/controllerEvents.dart';
import 'package:amge/external_lib/utilsScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class CadastroEventos extends StatefulWidget {
  @override
  _CadastroEventosState createState() => _CadastroEventosState();
}

class _CadastroEventosState extends State<CadastroEventos> {
  UtilsScreen screen = UtilsScreen.getInstance(
    backgroundColor1: Color(0xFF68a1f8),
    backgroundColor2: Color(0xFF3339fa),
    highlightColor: Color(0xFF5e43fc),
    foregroundColor: Colors.white,
    logo: AssetImage("assets/images/logo.png"),
  );

  TextEditingController txtTituloController = TextEditingController();
  TextEditingController txtDataInicioController = TextEditingController();
  TextEditingController txtDataFimController = TextEditingController();
  TextEditingController txtDescricaoController = TextEditingController();
  TextEditingController txtCepController = TextEditingController();
  TextEditingController txtCorController = TextEditingController();

  ControllerEvents ctrlEvento = ControllerEvents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // here the desired height
          child: AppBar(
            title: Text("Novo Evento"),
            backgroundColor: screen.backgroundColor1,
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Container(
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.bottomRight,
                    end: new Alignment(
                        1.0, 3.0), // 10% of the width, so there are ten blinds.
                    colors: [
                      screen.foregroundColor,
                      screen.foregroundColor,
                      screen.backgroundColor1,
                    ], // whitish to gray
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ),
                ),
                height: MediaQuery.of(context).size.height - 84,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    formTitulo(),
                    dataInicial(context),
                    dataFim(context),
                    formDescricao(),
                    formCep(),
                    SizedBox(
                      height: 50,
                      width: 50,
                    ),
                    btnPadrao(),
                  ],
                ),
              ),
            )));
  }

  Widget formTitulo() {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: screen.backgroundColor2,
              width: 0.5,
              style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: screen.backgroundColor2,
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: screen.backgroundColor2,
                fontFamily: 'Roboto',
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Título do Evento",
                labelStyle: TextStyle(
                  color: screen.backgroundColor2,
                  fontFamily: 'Roboto',
                  fontSize: 18,
                ),
                contentPadding: EdgeInsets.only(left: 20),
                border: InputBorder.none,
                //hintText: 'Nome de usuário',
                //hintStyle: TextStyle(color: this.foregroundColor),
              ),
              onSubmitted: (valor) {
                setState(() {
                  txtTituloController.text = valor;
                });
              },
              controller: txtTituloController,
            ),
          ),
        ],
      ),
    );
  }

  Widget dataInicial(BuildContext context) {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: screen.backgroundColor2,
              width: 0.5,
              style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: screen.backgroundColor2,
            ),
          ),
          Expanded(
            child: Column(children: <Widget>[
              DateTimeField(
                decoration: InputDecoration(
                  labelText: "Data Início",
                  labelStyle: TextStyle(
                    color: screen.backgroundColor2,
                    fontFamily: 'Roboto',
                    fontSize: 18,
                  ),
                  contentPadding: EdgeInsets.only(left: 20),
                  border: InputBorder.none,
                ),
                format: DateFormat("yyyy-MM-dd HH:mm"),
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now()),
                    );
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    txtDataInicioController.text = value.toString();
                  });
                },
                controller: txtDataInicioController,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget dataFim(BuildContext context) {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: screen.backgroundColor2,
              width: 0.5,
              style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: screen.backgroundColor2,
            ),
          ),
          Expanded(
            child: Column(children: <Widget>[
              DateTimeField(
                decoration: InputDecoration(
                  labelText: "Data Fim",
                  labelStyle: TextStyle(
                    color: screen.backgroundColor2,
                    fontFamily: 'Roboto',
                    fontSize: 18,
                  ),
                  contentPadding: EdgeInsets.only(left: 20),
                  border: InputBorder.none,
                ),
                format: DateFormat("yyyy-MM-dd HH:mm"),
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now()),
                    );
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    txtDataFimController.text = value.toString();
                  });
                },
                controller: txtDataFimController,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget formDescricao() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 5.0),
          child: Text(
            "Descição do Evento",
            style: TextStyle(
              color: screen.backgroundColor2,
              fontFamily: 'Roboto',
              fontSize: 18,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(this.context).size.width,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // color: Colors.white54,
            border: Border.all(
                color: screen.backgroundColor2,
                width: 1,
                style: BorderStyle.solid),
          ),
          padding: const EdgeInsets.only(left: 0.0, right: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
              //   child: Icon(
              //     Icons.arrow_forward_ios,
              //     color: screen.backgroundColor2,
              //   ),
              // ),
              Expanded(
                child: TextField(
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                    color: screen.backgroundColor2,
                    fontFamily: 'Roboto',
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    // labelText: "Título do Evento",
                    // labelStyle: TextStyle(
                    //   color: screen.backgroundColor2,
                    //   fontFamily: 'Roboto',
                    //   fontSize: 18,
                    // ),
                    contentPadding: EdgeInsets.only(left: 20),
                    border: InputBorder.none,
                    //hintText: 'Nome de usuário',
                    //hintStyle: TextStyle(color: this.foregroundColor),
                  ),
                  onSubmitted: (valor) {
                    setState(() {
                      txtDescricaoController.text = valor;
                    });
                  },
                  controller: txtDescricaoController,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget formCep() {
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: screen.backgroundColor2,
              width: 0.5,
              style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
            child: Icon(
              Icons.arrow_forward_ios,
              color: screen.backgroundColor2,
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: screen.backgroundColor2,
                fontFamily: 'Roboto',
                fontSize: 35,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Local do Evento (CEP apenas)",
                labelStyle: TextStyle(
                  color: screen.backgroundColor2,
                  fontFamily: 'Roboto',
                  fontSize: 18,
                ),
                contentPadding: EdgeInsets.only(left: 20),
                border: InputBorder.none,
                // hintText: 'Digite apenas o CEP do local',
                // hintStyle: TextStyle(color: Colors.grey),
              ),
              onSubmitted: (valor) {
                setState(() {
                  txtCepController.text = valor;
                });
              },
              controller: txtCepController,
            ),
          ),
        ],
      ),
    );
  }

  Widget btnPadrao() {
    String validou;
    var snack;
    return Container(
      width: MediaQuery.of(this.context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 8.0),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Builder(
                builder: (context) => FlatButton(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  color: screen.foregroundColor,
                  onPressed: () async => {
                    // print("onpressed ativado"),
                    // print(txtTituloController.text),
                    // print(txtDataInicioController.text),
                    // print(txtDataFimController.text),
                    // print(txtDescricaoController.text),
                    // print(txtCepController.text),
                    validou = await ctrlEvento.insereEvento(
                      txtTituloController.text,
                      txtDataInicioController.text,
                      txtDataFimController.text,
                      txtDescricaoController.text,
                      txtCepController.text,
                    ),
                    print("antes de validou"),
                    print(validou),
                    if (validou == "OK")
                      {
                        snack = SnackBar(
                          backgroundColor: Colors.greenAccent,
                          content: Text("Evento cadastrado com Sucesso!"),
                        ),
                        Scaffold.of(context).showSnackBar(snack),
                        await new Future.delayed(const Duration(seconds: 2)),
                        Navigator.pop(context),
                      }
                    else
                      {
                        snack = SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(validou),
                        ),
                        Scaffold.of(context).showSnackBar(snack),
                      },
                  },
                  child: Text(
                    "Adicionar",
                    style: TextStyle(
                      color: screen.backgroundColor2,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
