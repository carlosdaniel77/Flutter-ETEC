import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _nome = TextEditingController();
  TextEditingController _cep = TextEditingController();
  TextEditingController _rua = TextEditingController();
  TextEditingController _complemento = TextEditingController();
  TextEditingController _numero = TextEditingController();
  TextEditingController _bairro = TextEditingController();
  TextEditingController _cidade = TextEditingController();
  TextEditingController _estado = TextEditingController();
  TextEditingController _rendaMensal = TextEditingController();
  TextEditingController _limitedeCredito = TextEditingController();

  _calcular() {
    setState(() {
      if (_rendaMensal.text != "") {
        _limitedeCredito.text =
            (double.parse(_rendaMensal.text) * 0.30).toString();
      } else {
        _limitedeCredito.text = 0.toString();
      }
    });
  }

  void _buscaEndereco() async {
    if (_cep.text.trim().length == 8) {
      String urlAPI = "https://viacep.com.br/ws/${_cep.text}/json/";
      http.Response response;
      response = await http.get(urlAPI);
      Map<String, dynamic> retorno = json.decode(response.body);

      setState(() {
        _rua.text = retorno["logradouro"].toString();
        _complemento.text = retorno["complemento"].toString();
        _bairro.text = retorno["bairro"].toString();
        _cidade.text = retorno["localidade"].toString();
        _estado.text = retorno["uf"].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
            title: Center(child: Text('Cadastro do Cliente')),
            backgroundColor: Colors.redAccent),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 100.0, color: Colors.black54),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      controller: _nome,
                      decoration: const InputDecoration(
                        labelText: "Digite o seu Nome",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      controller: _cep,
                      decoration: const InputDecoration(
                        labelText: "Digite o CEP",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      controller: _rua,
                      decoration: const InputDecoration(
                        labelText: "Rua",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      controller: _complemento,
                      decoration: const InputDecoration(
                        labelText: "Complemento",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      controller: _bairro,
                      decoration: const InputDecoration(
                        labelText: "Bairro",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      controller: _cidade,
                      decoration: const InputDecoration(
                        labelText: "Cidade",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      controller: _estado,
                      decoration: const InputDecoration(
                        labelText: "Estado",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                    controller: _rendaMensal,
                    decoration: const InputDecoration(
                      labelText: "Renda Mensal",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) {
                      _calcular();
                    }, // do not hide keyboard
                    textInputAction: TextInputAction.send,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      controller: _limitedeCredito,
                      enabled: false,
                      decoration: const InputDecoration(
                        labelText: "Limite de Crédito",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      )),
                ),
                RaisedButton(
                    color: Colors.redAccent,
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: Text("Buscar Localização",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                    onPressed: _buscaEndereco)
              ],
            ),
          ),
        ));
  }
}
