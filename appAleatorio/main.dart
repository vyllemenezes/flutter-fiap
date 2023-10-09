import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaInicial();
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  TextEditingController num1Controller = TextEditingController();

  TextEditingController num2Controller = TextEditingController();

  int numero = 0;

  void _calcular() {
    setState(() {
      numero = new Random().nextInt(11);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Jogo Nº Aleatorio"),
          centerTitle: true,
          backgroundColor: Color(0xff1D3319),
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      width: double.infinity,
      color: Colors.white10,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _foto(),
          _texto(),
          SizedBox(height: 30),
          SizedBox(height: 16),
          _numero(),
          _button(),
        ],
      ),
    );
  }

  _numero() {
    return Text(
      numero.toString(),
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }

  _foto() {
    return Center(
      child: Image.network(
        'https://conteudo.imguol.com.br/c/noticias/8b/2018/09/21/joaquin-phoenix-com-a-maquiagem-de-palhaco-em-coringa-1537578484204_v2_1x1.jpg',
        height: 200,
        width: 300,
      ),
    );
  }

  _texto() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Text(
        "Pense em um número de 0 a 10",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }

  _button() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      width: 200,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff1D3319),
        ),
        onPressed: () {
          _calcular();
        },
        child: Text(
          "Verificar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
