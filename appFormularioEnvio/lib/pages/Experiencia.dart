import 'package:flutter/material.dart';
import 'Pessoal.dart';

class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TelaExperiencia();
  }
}

class TelaExperiencia extends StatefulWidget {
  const TelaExperiencia({Key? key}) : super(key: key);

  @override
  _TelaExperienciaState createState() => _TelaExperienciaState();
}

class _TelaExperienciaState extends State<TelaExperiencia> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  String dropdownSexoValor = "Masculino";
  String dropdownEscolaridadeValor = "Ensino Médio";
  double valorLimiteSlider = 200.00;
  bool valorBrasileiroSwitch = true;

  String dados = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experiência'),
        backgroundColor: Color(0xff1D3319),
      ),
      body: _body(context),
    );
  }

  _onClickVoltar(BuildContext context, Widget tela) {
    setState(() {
      String nome = nomeController.text;
      String idade = idadeController.text;
      String nacionalidade =
          (valorBrasileiroSwitch == true) ? 'Brasileira' : 'Estrangeira';

      dados =
          "Dados informados: \n\nNome: $nome \nIdade: $idade \nSexo: $dropdownSexoValor \nEscolaridade: $dropdownEscolaridadeValor \nLimite: $valorLimiteSlider \nNacionalidade: $nacionalidade";
      Navigator.pop(context, dados);
      MaterialPageRoute(builder: (BuildContext context) {
        return tela;
      });
    });
  }

  _button(BuildContext context, Widget tela) {
    return Container(
      width: 200,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
        ),
        onPressed: () {
          _onClickVoltar(context, tela);
        },
        child: Text(
          "Confirmar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  _body(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white10,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _campo("Digite o nome", nomeController),
          SizedBox(height: 10),
          _campo("Digite a idade", idadeController),
          SizedBox(height: 10),
          _dropdownSexo(),
          SizedBox(height: 10),
          _dropdownEscolaridade(),
          SizedBox(height: 10),
          _sliderLimite(),
          SizedBox(height: 10),
          _switchNacionalidade(),
          SizedBox(height: 30),
          _button(context, Pessoal()),
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
          labelText: title, labelStyle: TextStyle(color: Color(0xff1D3319))),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
      controller: controller,
    );
  }

  _texto() {
    return Text(
      dados,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }

  _dropdownSexo() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Sexo",
              style: TextStyle(fontSize: 20, color: Color(0xff1D3319))),
          SizedBox(width: 15),
          DropdownButton<String>(
            value: dropdownSexoValor,
            items: <String>['Masculino', 'Feminino'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? valorSelecionado) {
              setState(() {
                dropdownSexoValor = valorSelecionado!;
              });
            },
          ),
        ],
      ),
    );
  }

  _dropdownEscolaridade() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Escolaridade",
              style: TextStyle(fontSize: 20, color: Color(0xff1D3319))),
          SizedBox(width: 15),
          DropdownButton<String>(
            value: dropdownEscolaridadeValor,
            items: <String>[
              'Ensino Fundamental',
              'Ensino Médio',
              'Graduação',
              'Pós Graduação',
              'Mestrado',
              'Doutorado'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? valorSelecionado) {
              setState(() {
                dropdownEscolaridadeValor = valorSelecionado!;
              });
            },
          ),
        ],
      ),
    );
  }

  _sliderLimite() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Limite",
              style: TextStyle(fontSize: 20, color: Color(0xff1D3319))),
          Slider(
            value: valorLimiteSlider,
            min: 0,
            max: 1000,
            divisions: 20,
            label: (valorLimiteSlider > 800)
                ? 'Limite muito alto ($valorLimiteSlider)'
                : valorLimiteSlider.round().toString(),
            onChanged: (double value) {
              setState(() {
                valorLimiteSlider = value;
              });
            },
          ),
        ],
      ),
    );
  }

  _switchNacionalidade() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("Brasileiro?",
              style: TextStyle(fontSize: 20, color: Color(0xff1D3319))),
          SizedBox(width: 15),
          Switch(
            value: valorBrasileiroSwitch,
            onChanged: (value) {
              setState(() {
                valorBrasileiroSwitch = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
