import 'package:flutter/material.dart';

import '../model/treino.dart';
import '../util/dbhelper.dart';
import 'tela_cadastro.dart';
import 'tela_detalhe.dart';

class ListaTreinos extends StatefulWidget {
  @override
  ListaTreinosState createState() => ListaTreinosState();
}

class ListaTreinosState extends State<ListaTreinos> {
  List<Treino> treinos = [];

  @override
  void initState() {
    super.initState();
    _carregaTreinos();
  }

  void _carregaTreinos() async {
    List dados = await DbHelper().getTreinos();
    List<Treino> lista = [];
    for (var item in dados) {
      lista.add(Treino.fromMap(item));
    }
    setState(() {
      treinos = lista;
    });
  }

  void _abreTelaCadastro() async {
    var resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TelaCadastro();
        },
      ),
    );

    if (resultado == true) {
      _carregaTreinos();
    }
  }

  void _abreTelaDetalhe(Treino treino) async {
    var resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TelaDetalhe(treino: treino);
        },
      ),
    );

    if (resultado == true) {
      _carregaTreinos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Treinos")),
      body: treinos.isEmpty
          ? Center(child: Text("Nenhum treino cadastrado"))
          : ListView.builder(
              itemCount: treinos.length,
              itemBuilder: (context, index) {
                Treino treino = treinos[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.fitness_center),
                    title: Text(treino.exercicio),
                    subtitle: Text(
                      "${treino.series} séries x ${treino.repeticoes} repetições - ${treino.data}",
                    ),
                    onTap: () {
                      _abreTelaDetalhe(treino);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abreTelaCadastro,
        child: Icon(Icons.add),
      ),
    );
  }
}
