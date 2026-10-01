// Testes unitarios da classe Treino (model).
//
// Nao dependem de plugins de plataforma (sqflite/path_provider),
// entao rodam instantaneamente com `flutter test`.

import 'package:flutter_test/flutter_test.dart';
import 'package:lista_treinos/model/treino.dart';

void main() {
  test('Construtor normal cria treino sem id', () {
    final treino = Treino('Supino', 4, 12, '06/08/2026');

    expect(treino.id, isNull);
    expect(treino.exercicio, 'Supino');
    expect(treino.series, 4);
    expect(treino.repeticoes, 12);
    expect(treino.data, '06/08/2026');
  });

  test('Construtor withId cria treino com id definido', () {
    final treino = Treino.withId('1', 'Agachamento', 3, 10, '06/08/2026');

    expect(treino.id, '1');
    expect(treino.exercicio, 'Agachamento');
  });

  test('Setters validam valores invalidos e ignoram a alteracao', () {
    final treino = Treino('Supino', 4, 12, '06/08/2026');

    treino.series = -1;
    expect(treino.series, 4); // valor invalido, mantem o anterior

    treino.repeticoes = 0;
    expect(treino.repeticoes, 12); // valor invalido, mantem o anterior

    treino.series = 5;
    expect(treino.series, 5); // valor valido, atualiza
  });

  test('toMap gera um Map com todos os campos', () {
    final treino = Treino.withId('2', 'Rosca direta', 3, 15, '06/08/2026');
    final map = treino.toMap();

    expect(map['id'], '2');
    expect(map['exercicio'], 'Rosca direta');
    expect(map['series'], 3);
    expect(map['repeticoes'], 15);
    expect(map['data'], '06/08/2026');
  });

  test('toMap sem id nao inclui a chave id', () {
    final treino = Treino('Supino', 4, 12, '06/08/2026');
    final map = treino.toMap();

    expect(map.containsKey('id'), isFalse);
  });

  test('fromMap reconstroi um Treino equivalente ao original', () {
    final original = Treino.withId('3', 'Leg press', 4, 20, '06/08/2026');
    final reconstruido = Treino.fromMap(original.toMap());

    expect(reconstruido.id, original.id);
    expect(reconstruido.exercicio, original.exercicio);
    expect(reconstruido.series, original.series);
    expect(reconstruido.repeticoes, original.repeticoes);
    expect(reconstruido.data, original.data);
  });
}
