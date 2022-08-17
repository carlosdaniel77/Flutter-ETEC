import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aula090822/providers/amigos.dart';
import 'package:aula090822/model/amigo.dart';

class TelaMantemAmigo extends StatefulWidget {
  @override
  _TelaMantemAmigoState createState() => _TelaMantemAmigoState();
}

class _TelaMantemAmigoState extends State<TelaMantemAmigo> {
  TextEditingController _nome = TextEditingController();
  TextEditingController _email = TextEditingController();

  _grava() {
    if (_nome.text.isEmpty == false && _email.text.isEmpty == false) {
      Provider.of<Amigos>(context, listen: false).addAmigo(
          new Amigo(' ', _nome.text.toString(), _email.text.toString()));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffb5b5b5),
        appBar: AppBar(
            title: Center(child: Text('Cadastro de Amigo')),
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
                      controller: _nome,
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
                      controller: _email,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail),
                        labelText: "Digite o seu E-mail",
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
