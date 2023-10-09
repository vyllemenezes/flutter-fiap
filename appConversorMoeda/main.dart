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
  TextEditingController valorController = TextEditingController();

  String moedaOrigem = "Real";
  String moedaDestino = "Real";
  String resultado = "";

  void _converter() {
    setState(() {
      double valor = double.parse(valorController.text);
      double valorConvertido = 0.00;

      if ((moedaOrigem == "Real") && (moedaDestino == "Dólar")) {
        valorConvertido = valor * 0.19;
      } else if ((moedaOrigem == "Real") && (moedaDestino == "Euro")) {
        valorConvertido = valor * 0.18;
      } else if ((moedaOrigem == "Dólar") && (moedaDestino == "Real")) {
        valorConvertido = valor * 5.15;
      } else if ((moedaOrigem == "Dólar") && (moedaDestino == "Euro")) {
        valorConvertido = valor * 0.95;
      } else if ((moedaOrigem == "Euro") && (moedaDestino == "Real")) {
        valorConvertido = valor * 5.43;
      } else if ((moedaOrigem == "Euro") && (moedaDestino == "Dólar")) {
        valorConvertido = valor * 1.06;
      } else if ((moedaOrigem == "Real") && (moedaDestino == "Real")) {
        valorConvertido = valor;
      } else if ((moedaOrigem == "Euro") && (moedaDestino == "Euro")) {
        valorConvertido = valor;
      } else if ((moedaOrigem == "Dólar") && (moedaDestino == "Dólar")) {
        valorConvertido = valor;
      }

      resultado = valorConvertido.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Conversor de Moedas"),
          centerTitle: true,
          backgroundColor: Color(0xff9A031E),
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
          _campo(),
          SizedBox(height: 10),
          _obs(),
          SizedBox(height: 10),
          _dropdownOrigem(),
          SizedBox(height: 10),
          _dropdownDestino(),
          SizedBox(height: 30),
          _button(),
          SizedBox(height: 16),
          _texto(),
        ],
      ),
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

  _obs() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: Text(
        "Utilize ponto ao invés de virgula!",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }

  _button() {
    return Container(
      width: 200,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff1D3319),
        ),
        onPressed: () {
          _converter();
        },
        child: Text(
          "Calcular",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  _campo() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: 'Digite um valor',
          labelStyle: TextStyle(color: Color(0xff9A031E))),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: valorController,
    );
  }

  _dropdownOrigem() {
    return DropdownButton<String>(
      value: moedaOrigem,
      items: <String>['Real', 'Dólar', 'Euro'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          moedaOrigem = valorSelecionado!;
        });
      },
    );
  }

  _dropdownDestino() {
    return DropdownButton<String>(
      value: moedaDestino,
      items: <String>['Real', 'Dólar', 'Euro'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          moedaDestino = valorSelecionado!;
        });
      },
    );
  }
}
