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
      title: Text("FastShop"),
      centerTitle: true,
      backgroundColor: Color(0xff9A031E),
    );
  }

  _corpo() {
    return Container(
      child: PageView(
        children: <Widget>[
          _anuncio('iPhone 13 Apple', 'iphone1.jpeg', 'iOS 15'),
          _anuncio('iPhone 13 Apple', 'iphone2.jpeg', '128GB'),
          _anuncio('iPhone 13 Apple', 'iphone3.jpeg', 'Modelo Meia-noite'),
          _anuncio('iPhone 13 Apple', 'iphone4.jpeg', 'Tela de 6,1'),
          _anuncio('iPhone 13 Apple', 'iphone5.jpeg', 'Câmera Dupla de 12 MP'),
        ],
      ),
    );
  }

  _foto(String nomeFoto) {
    return Image.asset(
      "assets/images/$nomeFoto",
      height: 300,
      width: 300,
      //fit: BoxFit.fill,
      fit: BoxFit.contain,
      //fit: BoxFit.cover,
    );
  }

  _textoAnuncio(String texto) {
    return Text(
      texto,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xff1D3319),
        fontSize: 20,
      ),
    );
  }

  _tituloAnuncio(String titulo) {
    return Text(
      titulo,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xff9A031E),
        fontSize: 30,
      ),
    );
  }

  _anuncio(String tituloAnuncio, String caminhoFoto, String texto) {
    return Container(
      child: Column(children: <Widget>[
        SizedBox(height: 15),
        _tituloAnuncio(tituloAnuncio),
        _foto(caminhoFoto),
        _textoAnuncio(texto),
      ]),
    );
  }
}
