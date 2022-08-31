import 'package:flutter/material.dart';
import 'package:aula090822/model/amigo.dart';

class Amigos with ChangeNotifier {
  static final List<Amigo> _itens = [];

  static List<Amigo> get itens {
    //... operador Sprad envia a lista sem permitir sua edição.
    return [..._itens];
  }

  static int get itensCount {
    return _itens.length;
  }

  static Amigo getItem(int indice) {
    return _itens[indice];
  }

  addAmigo(Amigo amigo) {
    //if de linha <teste> ? <Se teste for verdadeiro> : <se teste for falso>
    amigo.codigo == ' ' ? amigo.codigo == (_itens.length + 1).toString() : true;
    _itens.add(amigo);
    notifyListeners();
  }
}
