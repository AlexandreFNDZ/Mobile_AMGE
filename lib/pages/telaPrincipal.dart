import 'package:amge/external_lib/utilsScreen.dart';
import 'package:flutter/material.dart';

UtilsScreen screen = UtilsScreen.getInstance();

class TelaPrincipal extends StatelessWidget {
  TelaPrincipal();

  @override
  Widget build(BuildContext sContext) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: _TelaPrincipal(),
    );
  }
}

class _TelaPrincipal extends StatefulWidget {
  _TelaPrincipal({
    Key key,
  }) : super(key: key);

  @override
  __TelaPrincipal createState() => __TelaPrincipal();
}

class __TelaPrincipal extends State<_TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Text("PAGINA PRINCIPAL"),
          ),
        ),
      ),
    );
  }
}
