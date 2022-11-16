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
  TextEditingController _endereco = TextEditingController();
  String _result = "";

  _buscaEndereco() async {
    String _cep = _endereco.text;

    Uri urlAPI = Uri.parse("https://viacep.com.br/ws/$_cep/json/");

    http.Response response;

    response = await http.get(urlAPI);

    Map<String, dynamic> retorno = json.decode(response.body);

    String _rua = retorno["logradouro"];
    String _bairro = retorno["bairro"];
    String _cidade = retorno["localidade"];
    String _estado = retorno["uf"];

    setState(() {
      _result = "$_rua, $_bairro, $_cidade, $_estado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 154, 160, 168),
        appBar: AppBar(
          title: Center(child: Text('Localização do CEP')),
          backgroundColor: Color.fromARGB(255, 31, 31, 31),
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 80.0, color: Colors.black54),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Insira o CEP',
                  ),
                  controller: _endereco,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                    "" + _result,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                ElevatedButton(
                    child: Text("Buscar",
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
