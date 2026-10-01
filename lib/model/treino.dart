class Treino {
  String? _id;
  String _exercicio;
  int _series;
  int _repeticoes;
  String _data;

  Treino(this._exercicio, this._series, this._repeticoes, this._data);

  Treino.withId(
    this._id,
    this._exercicio,
    this._series,
    this._repeticoes,
    this._data,
  );

  String? get id => _id;
  String get exercicio => _exercicio;
  int get series => _series;
  int get repeticoes => _repeticoes;
  String get data => _data;

  set exercicio(String newExercicio) {
    if (newExercicio.isNotEmpty && newExercicio.length <= 255) {
      _exercicio = newExercicio;
    }
  }

  set series(int newSeries) {
    if (newSeries > 0) {
      _series = newSeries;
    }
  }

  set repeticoes(int newRepeticoes) {
    if (newRepeticoes > 0) {
      _repeticoes = newRepeticoes;
    }
  }

  set data(String newData) {
    if (newData.isNotEmpty) {
      _data = newData;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["exercicio"] = _exercicio;
    map["series"] = _series;
    map["repeticoes"] = _repeticoes;
    map["data"] = _data;
    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Treino.fromMap(Map<String, dynamic> o)
    : _id = o["id"],
      _exercicio = o["exercicio"],
      _series = o["series"],
      _repeticoes = o["repeticoes"],
      _data = o["data"];
}
