import 'package:flutter/material.dart';

class Pessoal extends StatefulWidget {
  const Pessoal({Key? key}) : super(key: key);

  @override
  _PessoalState createState() => _PessoalState();
}

class _PessoalState extends State<Pessoal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: _titulo(),
          backgroundColor: Colors.white,
          body: _body(),
        ),
      ),
    );
  }

  _titulo() {
    return AppBar(
        title: Text("App Tab Bar"),
        centerTitle: true,
        backgroundColor: Color(0xff1D3319),
        bottom: TabBar(tabs: [
          Tab(
            text: 'Pessoal',
          ),
          Tab(
            text: 'Formação',
          ),
          Tab(
            text: 'Experiência',
          ),
        ]));
  }

  _body() {
    return TabBarView(
      children: [
        Center(child: Text("Aba de Pessoal")),
        Center(child: Text("Aba de Formação")),
        Center(child: Text("Aba de Experiência")),
      ],
    );
  }
}
