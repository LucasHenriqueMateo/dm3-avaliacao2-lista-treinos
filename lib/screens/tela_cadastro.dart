import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/treino.dart';
import '../util/dbhelper.dart';

class TelaCadastro extends StatefulWidget {
  @override
  TelaCadastroState createState() => TelaCadastroState();
}

class TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController tcExercicio = TextEditingController();
  final TextEditingController tcSeries = TextEditingController();
  final TextEditingController tcRepeticoes = TextEditingController();

  InputDecoration decora(String texto) {
    return InputDecoration(
      hintText: texto,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

  void _salvar() async {
    String exercicio = tcExercicio.text;
    String textoSeries = tcSeries.text;
    String textoRepeticoes = tcRepeticoes.text;

    if (exercicio.isEmpty || textoSeries.isEmpty || textoRepeticoes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Preencha todos os campos.")),
      );
      return;
    }

    int? series = int.tryParse(textoSeries);
    int? repeticoes = int.tryParse(textoRepeticoes);

    if (series == null || series <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Informe um número de séries válido.")),
      );
      return;
    }

    if (repeticoes == null || repeticoes <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Informe um número de repetições válido.")),
      );
      return;
    }

    String data = DateFormat('dd/MM/yyyy').format(DateTime.now());

    Treino treino = Treino(exercicio, series, repeticoes, data);
    await DbHelper().insertTreino(treino);

    Navigator.pop(context, true);
  }

  void _cancelar() {
    Navigator.pop(context, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Novo Treino")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                controller: tcExercicio,
                decoration: decora("Nome do exercício"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                controller: tcSeries,
                keyboardType: TextInputType.number,
                decoration: decora("Séries"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TextField(
                controller: tcRepeticoes,
                keyboardType: TextInputType.number,
                decoration: decora("Repetições"),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: _salvar,
                    child: Text("SALVAR"),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _cancelar,
                    child: Text("CANCELAR"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
