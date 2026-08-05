import 'package:flutter/material.dart';

import '../model/treino.dart';
import '../util/dbhelper.dart';

class TelaDetalhe extends StatefulWidget {
  final Treino treino;

  TelaDetalhe({required this.treino});

  @override
  TelaDetalheState createState() => TelaDetalheState();
}

class TelaDetalheState extends State<TelaDetalhe> {
  Widget _campo(String rotulo, String valor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            rotulo,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
          Text(valor, style: TextStyle(fontSize: 20.0)),
        ],
      ),
    );
  }

  void _confirmaExclusao() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Excluir treino"),
          content: Text(
            "Deseja realmente excluir o treino '${widget.treino.exercicio}'?",
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("CANCELAR"),
            ),
            TextButton(
              onPressed: () async {
                await DbHelper().deleteTreino(widget.treino.id!);
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
              child: Text("EXCLUIR"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do Treino")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _campo("Exercício", widget.treino.exercicio),
            _campo("Séries", widget.treino.series.toString()),
            _campo("Repetições", widget.treino.repeticoes.toString()),
            _campo("Data", widget.treino.data),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: _confirmaExclusao,
              child: Text("EXCLUIR"),
            ),
          ],
        ),
      ),
    );
  }
}
