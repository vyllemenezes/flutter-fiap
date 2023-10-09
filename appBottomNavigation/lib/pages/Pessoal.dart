import 'package:flutter/material.dart';
import 'Formacao.dart';
import 'Experiencia.dart';

class Pessoal extends StatefulWidget {
  const Pessoal({Key? key}) : super(key: key);

  @override
  _PessoalState createState() => _PessoalState();
}

class _PessoalState extends State<Pessoal> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: Text('Tela Pessoal')),
    Formacao(),
    Experiencia(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          //iconSize: 20,
          //selectedFontSize: 20,
          //unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Pessoal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_alert_sharp),
              label: 'Formação',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail),
              label: 'Experiência',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("App BottomNav"),
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
            _botao(context, 'Ir para Tela Sobre', Formacao()),
            _botao(context, 'Ir para Tela Contato', Experiencia()),
            _texto(),
          ],
        ),
      ),
    );
  }

  _texto() {
    return Text(
      'Tela Home',
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
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

  _onClickNavegacao(BuildContext context, Widget tela) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return tela;
      }),
    );
  }
}
