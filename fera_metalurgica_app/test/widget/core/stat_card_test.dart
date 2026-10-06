import 'package:fera_metalurgica_app/core/widgets/stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_themed.dart';

void main() {
  testWidgets('mostra rótulo, valor e ícone e responde ao toque', (
    tester,
  ) async {
    var tocou = false;
    await pumpThemed(
      tester,
      StatCard(
        label: 'Aprovados',
        valor: '45',
        icone: Icons.check_circle_outline,
        onTap: () => tocou = true,
      ),
    );

    expect(find.text('Aprovados'), findsOneWidget);
    expect(find.text('45'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);

    await tester.tap(find.byType(StatCard));
    expect(tocou, isTrue);
  });
}
