import 'package:firebase_database/firebase_database.dart';

import '../model/treino.dart';

class DbHelper {
  String tblTreino = "treinos";

  DbHelper._internal();
  static final DbHelper _dbHelper = DbHelper._internal();
  factory DbHelper() {
    return _dbHelper;
  }

  DatabaseReference get db => FirebaseDatabase.instance.ref(tblTreino);

  Future<void> insertTreino(Treino treino) async {
    await db.push().set(treino.toMap());
  }

  Future<List> getTreinos() async {
    DataSnapshot snapshot = await db.orderByKey().get();
    List result = [];
    for (DataSnapshot item in snapshot.children) {
      Map<String, dynamic> map = Map<String, dynamic>.from(item.value as Map);
      map["id"] = item.key;
      result.add(map);
    }
    // As chaves do push() sao cronologicas: inverte para o mais recente primeiro.
    return result.reversed.toList();
  }

  Future<void> deleteTreino(String id) async {
    await db.child(id).remove();
  }
}
