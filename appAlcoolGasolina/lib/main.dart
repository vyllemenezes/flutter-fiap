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
        double alcool = double.parse(num1Controller.text);
        double gasolina = double.parse(num2Controller.text);
        double res = alcool / gasolina;

        if (res > 0.7) {
          resultado = "Melhor gasolina";
        } else {
          resultado = "Melhor alcool";
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
          title: Text("Alcool ou Gasolina"),
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
          _campo("Preço do Alcool", num1Controller),
          SizedBox(height: 10),
          _campo("Preço da Gasolina", num2Controller),
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
        fontSize: 28,
      ),
    );
  }

  _foto() {
    return Center(
      child: Image.network(
        'https://paineira.usp.br/bios/wp-content/uploads/2010/07/etanol-gasolina.png?w=300',
        height: 150,
        width: 150,
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
