// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lista_treinos/main.dart';

void main() {
  testWidgets('Tela principal exibe o titulo Lista de Treinos', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app bar title is shown.
    expect(find.text('Lista de Treinos'), findsOneWidget);

    // Verify that the "add" floating action button is present.
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
