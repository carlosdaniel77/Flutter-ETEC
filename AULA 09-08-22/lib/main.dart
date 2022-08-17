import 'package:aula090822/screen/telaAmigosList.dart';
import 'package:aula090822/screen/telaMantemAmigo.dart';
import 'package:aula090822/utils/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aula090822/providers/amigos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Amigos(),
        child: MaterialApp(
            title: 'Amigos',
            theme: ThemeData(
              primarySwatch: Colors.indigo,
              accentColor: Colors.amber,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: TelaAmigosList(),
            routes: {
              AppRoutes.MANTEMAMIGOS_FORM: (context) => TelaMantemAmigo()
            }));
  }
}
