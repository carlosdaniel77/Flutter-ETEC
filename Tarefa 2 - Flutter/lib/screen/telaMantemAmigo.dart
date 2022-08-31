import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aula090822/providers/amigos.dart';
import 'package:aula090822/model/amigo.dart';

class TelaMantemAmigo extends StatefulWidget {
  @override
  _TelaMantemAmigoState createState() => _TelaMantemAmigoState();
}

class _TelaMantemAmigoState extends State<TelaMantemAmigo> {
  TextEditingController _codigo = TextEditingController();
  TextEditingController _nome = TextEditingController();
  TextEditingController _nomeDono = TextEditingController();
  TextEditingController _telefone = TextEditingController();
  TextEditingController _foto = TextEditingController();

  _grava() {
    if (_codigo.text.isEmpty == false &&
        _nome.text.isEmpty == false &&
        _nomeDono.text.isEmpty == false &&
        _telefone.text.isEmpty == false &&
        _foto.text.isEmpty == false) {
      Provider.of<Amigos>(context, listen: false).addAmigo(new Amigo(
          ' ',
          _codigo.text.toString(),
          _nome.text.toString(),
          _nomeDono.text.toString(),
          _telefone.text.toString()));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffb5b5b5),
        appBar: AppBar(
            title: Center(child: Text('Cadastro de Animal')),
            backgroundColor: Color(0xff666666)),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle_rounded,
                    size: 100.0, color: Colors.black),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      maxLength: 10,
                      controller: _codigo,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.code),
                        labelText: "Informe o código",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      maxLength: 30,
                      controller: _nome,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.pets),
                        labelText: "Informe o nome do pet",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      maxLength: 50,
                      controller: _nomeDono,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: "Informe o nome",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      maxLength: 15,
                      controller: _telefone,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone_outlined),
                        labelText: "Digite seu telefone",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextField(
                      maxLength: 70,
                      controller: _foto,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.add_a_photo),
                        labelText: "Adiciona sua foto",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      )),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff727272),
                    elevation: 30,
                    shadowColor: Color(0xff000000),
                  ),
                  child: Text(
                    'Adicionar',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: _grava,
                ),
              ],
            ),
          ),
        ));
  }
}
