import 'package:flutter/material.dart';
import 'screens/lista_treinos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Treinos',
      debugShowCheckedModeBanner: false,
      home: ListaTreinos(),
    );
  }
}
