import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/treino.dart';

class DbHelper {
  String tblTreino = "treino";
  String colId = "id";
  String colExercicio = "exercicio";
  String colSeries = "series";
  String colRepeticoes = "repeticoes";
  String colData = "data";

  DbHelper._internal();
  static final DbHelper _dbHelper = DbHelper._internal();
  factory DbHelper() {
    return _dbHelper;
  }

  static Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db!;
  }

  Future<Database> initializeDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "/treinos.db";
    var db = await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE $tblTreino ("
      "$colId INTEGER PRIMARY KEY, "
      "$colExercicio TEXT, "
      "$colSeries INTEGER, "
      "$colRepeticoes INTEGER, "
      "$colData TEXT)",
    );
  }

  Future<int> insertTreino(Treino treino) async {
    Database db = await this.db;
    var result = await db.insert(tblTreino, treino.toMap());
    return result;
  }

  Future<List> getTreinos() async {
    Database db = await this.db;
    var result = await db.rawQuery(
      "SELECT * FROM $tblTreino ORDER BY $colId DESC",
    );
    return result;
  }

  Future<int> deleteTreino(int id) async {
    var db = await this.db;
    var result = await db.rawDelete(
      'DELETE FROM $tblTreino WHERE $colId = $id',
    );
    return result;
  }
}
