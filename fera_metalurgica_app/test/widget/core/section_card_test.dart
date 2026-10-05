import 'package:fera_metalurgica_app/core/widgets/section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_themed.dart';

void main() {
  testWidgets('mostra título em caixa alta, ícone e conteúdo', (tester) async {
    await pumpThemed(
      tester,
      const SectionCard(
        titulo: 'Cliente',
        icone: Icons.person_outline,
        child: Text('João da Silva'),
      ),
    );

    expect(find.text('CLIENTE'), findsOneWidget);
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
    expect(find.text('João da Silva'), findsOneWidget);
  });

  testWidgets('sem título renderiza só o conteúdo', (tester) async {
    await pumpThemed(tester, const SectionCard(child: Text('Conteúdo')));

    expect(find.text('Conteúdo'), findsOneWidget);
    expect(find.byType(Icon), findsNothing);
  });
}
