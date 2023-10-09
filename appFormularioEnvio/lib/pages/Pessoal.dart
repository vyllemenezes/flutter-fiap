import 'package:flutter/material.dart';
import 'Experiencia.dart';

class Pessoal extends StatefulWidget {
  const Pessoal({Key? key}) : super(key: key);

  @override
  _PessoalState createState() => _PessoalState();
}

class _PessoalState extends State<Pessoal> {
  String retorno = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(context),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Pessoal"),
      centerTitle: true,
      backgroundColor: Color(0xff1D3319),
    );
  }

  _corpo(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _botao(context, 'Iniciar Formulario', Experiencia()),
            _texto(),
          ],
        ),
      ),
    );
  }

  _texto() {
    return Text(
      retorno,
      style: TextStyle(
          color: Color(0xff9A031E),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _botao(BuildContext context, String textoBotao, Widget tela) {
    return ElevatedButton(
        child: Text(
          textoBotao,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          _onClickNavegacao(context, tela);
        });
  }

  _onClickNavegacao(BuildContext context, Widget tela) async {
    String retorno2 = await Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return tela;
      }),
    );
    setState(() {
      retorno = retorno2;
    }); //ou um setState()
  }

  _texto2() {
    return Text(
      retorno,
      style: TextStyle(
        color: Colors.black,
        fontSize: 28,
      ),
    );
  }
}
