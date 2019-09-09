
import 'package:flutter/material.dart';

import 'Pessoa.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState(); // chamada da tela principal
}

class _HomeState extends State<Home> {
  TextEditingController _weightController =
      TextEditingController(); // função callback
  TextEditingController _heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var pessoa = Pessoa(0, 0, "");
  String _result;

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetFields() {
    _weightController.text = '';
    _heightController.text = '';
    setState(() {
      _result = 'Informe seus dados';
    });
  }

  var _radioGroup = 0;
  void calculateImc() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text);
    var generoImc = new Radio(
      value: null,
    );

    if (generoImc == 0)
      pessoa = Pessoa(weight, height, "masc");
    else
      pessoa = Pessoa(weight, height, "fem");
    setState(() {
      _result = pessoa.classificar();
      color = pessoa.color;
    });
  }

  Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                resetFields();
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 0,
                          groupValue: _radioGroup,
                          onChanged: (value) {
                            setState(() {
                              _radioGroup = value;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        new Text(
                          'Homen',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          value: 1,
                          groupValue: _radioGroup,
                          onChanged: (value) {
                            setState(() {
                              _radioGroup = value;
                            });
                          },
                          activeColor: Colors.pink,
                        ),
                        new Text(
                          'Mulher',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Peso (kg)'),
                      controller: _weightController,
                      validator: (text) {
                        return text.isEmpty ? "Insira seu peso!" : null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Altura (cm)'),
                      controller: _heightController,
                      validator: (text) {
                        return text.isEmpty ? "Insira sua altura!" : null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 36.0),
                      child: Container(
                        color: pessoa.color,
                        child: Text(
                          _result,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 36.0),
                        child: Container(
                            height: 50,
                            child: RaisedButton(
                              color: Colors.blueAccent,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  calculateImc();
                                }
                              },
                              child: Text('CALCULAR',
                                  style: TextStyle(color: Colors.white)),
                            ))),
                  ],
                ))));
  }

  void eventButton(value) {
    setState(() {});
  }
}
