import 'package:fera_metalurgica_app/features/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DashboardPage mostra o título do app e os indicadores', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: DashboardPage()));

    expect(find.text('FERA'), findsOneWidget);
    expect(find.text('Em andamento'), findsOneWidget);
    expect(find.text('Aguardando resposta'), findsOneWidget);
    expect(find.text('Aprovados'), findsOneWidget);
    expect(find.text('Pendentes'), findsOneWidget);
  });
}
