import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Vagas FIAP"),
      centerTitle: true,
      backgroundColor: Color(0xff1D3319),
    );
  }

  _corpo() {
    return Container(
      child: ListView(
        children: <Widget>[
          _vaga('Desenvolvedor Backend',
              'Salário: 3500,00. \nExperiencia com desenvolvimento em Typescript; \nConhecimento em Git; Conhecimento em Node; Contato: netvagas@contato.com'),
          _vaga('Desenvolvedor Frontend',
              'Salário: 2500,00. \nTer disponibilidade para trabalho presencial em Londrina/PR; \nExperiência em projetos utilizando REACTJS; Contato: interar@contato.com'),
          _vaga('Cientista de Dados',
              'Salário: 5000,00. \nExperiência em SQL, Experiência em Python, Experiência em PySpark. Contato: intera@contato.com'),
          _vaga('Programador Junior',
              'Salário: 1200,00. \nTecnologia da Informação, Ensino Superior, Análise e desenvolvimento de sistemas, Ensino Superior. Contato: cobrape@contato.com'),
        ],
      ),
    );
  }

  _textoVaga(String texto) {
    return Text(
      texto,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }

  _tituloVaga(String titulo) {
    return Text(
      titulo,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xff9A031E),
        fontSize: 28,
      ),
    );
  }

  _vaga(String tituloVaga, String textoVaga) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      child: Column(children: <Widget>[
        SizedBox(height: 15),
        _tituloVaga(tituloVaga),
        SizedBox(height: 10),
        _textoVaga(textoVaga),
      ]),
    );
  }
}
