import 'package:flutter/material.dart';

class Pessoa {
  var peso = 0.0;
  var altura = 0.0;
  var genero = "null";
  var _result = "";
  var color;

  Pessoa(double peso, double altura, String genero) {
    this.peso = peso;
    this.altura = altura;
    this.genero = genero;
  }

  double calcularIMC() {
    return peso / (altura * altura);
  }

  String classificar() {
    if (genero == "masc") {
      _result = "IMC = ${calcularIMC().toStringAsPrecision(6)}\n";
      if (calcularIMC() < 20) {
        _result += "Abaixo do peso";
        color = Colors.blue[300];
      } else if (calcularIMC() < 25) {
        _result += "Peso ideal";
        color = Colors.green[300];
      } else if (calcularIMC() < 30) {
        _result += "Levemente acima do peso";
        color = Colors.red[600];
      } else if (calcularIMC() < 35) {
        _result += "Obesidade Grau I";
        color = Colors.red[700];
      } else if (calcularIMC() < 40) {
        _result += "Obesidade Grau II";
        color = Colors.redAccent[400];
      } else{
        _result += "Obesidade Grau IIII";
      color = Colors.redAccent[700];
      }
    } else {
      _result = "IMC = ${calcularIMC().toStringAsPrecision(6)}\n";
      if (calcularIMC() < 18.6) {
        _result += "Abaixo do peso";
        color = Colors.blue[300];
      } else if (calcularIMC() < 24) {
        _result += "Peso ideal";
        color = Colors.green[300];
      } else if (calcularIMC() < 29) {
        _result += "Levemente acima do peso";
        color = Colors.red[50];
      } else if (calcularIMC() < 38) {
        _result += "Obesidade Grau I";
        color = Colors.red[100];
      } else if (calcularIMC() < 39) {
        _result += "Obesidade Grau II";
        color = Colors.red[200];
      } else{
        _result += "Obesidade Grau IIII";
      color = Colors.red[300];
      }
    }
    return _result;
  }
}
