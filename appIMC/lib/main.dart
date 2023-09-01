import 'dart:developer';

import 'package:flutter/material.dart';

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

  String resultado = "";

  void _calcular() {
    setState(() {
      if (num1Controller.text == "" || num2Controller.text == "") {
        resultado = "Preencha os dois campos";
      } else {
        double peso = double.parse(num1Controller.text);
        double altura = double.parse(num2Controller.text);
        double formula = peso / (altura * altura);

        if (formula < 18.5) {
          resultado = "Classificação: Abaixo do Peso";
        } else if (formula < 25) {
          resultado = "Classificação: Peso normal";
        } else if (formula < 30) {
          resultado = "Classificação: Sobrepeso";
        } else if (formula < 35) {
          resultado = "Classificação: Obesidade Grau I";
        } else if (formula < 40) {
          resultado = "Classificação: Obesidade Grau II";
        } else {
          resultado = "Classificação: Obesidade Grau III";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("IMC"),
          centerTitle: true,
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
          _campo("Peso", num1Controller),
          SizedBox(height: 10),
          _campo("Altura", num2Controller),
          _obs(),
          SizedBox(height: 30),
          _button(),
          SizedBox(height: 16),
          _texto(),
        ],
      ),
    );
  }

  _campo(String title, TextEditingController controller) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: title, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey, fontSize: 25.0),
      controller: controller,
    );
  }

  _texto() {
    return Text(
      resultado,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }

  _foto() {
    return Center(
      child: Image.network(
        'https://www.drrogermoura.com.br/images/artigos/tabela-imc.png',
        height: 200,
        width: 300,
      ),
    );
  }

  _obs() {
    return Container(
      child: Text("para numeros fracionários utilize ponto"),
    );
  }

  _button() {
    return Container(
      width: 200,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
        ),
        onPressed: () {
          _calcular();
        },
        child: Text(
          "Verificar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
