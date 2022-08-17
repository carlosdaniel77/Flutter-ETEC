import 'package:flutter/material.dart';
import 'package:aula090822/providers/amigos.dart';
import 'package:aula090822/utils/AppRoutes.dart';
import 'package:aula090822/screen/telaMantemAmigo.dart';
import 'package:provider/provider.dart';

class TelaAmigosList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Amigos'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.MANTEMAMIGOS_FORM);
            },
          )
        ]),
        body: Consumer<Amigos>(
          child: Text('Sem Informações'),
          builder: (context, amigo, child) => Amigos.itensCount == 0
              ? child
              : ListView.builder(
                  itemCount: Amigos.itensCount,
                  itemBuilder: (context, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: null,
                    ),
                    title: Text(Amigos.getItem(i).nome),
                  ),
                ),
        ));
  }
}
