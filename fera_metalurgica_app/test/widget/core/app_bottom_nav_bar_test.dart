import 'package:fera_metalurgica_app/core/widgets/app_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_themed.dart';

void main() {
  testWidgets('mostra as abas e informa o índice tocado', (tester) async {
    int? tocado;
    await pumpThemed(
      tester,
      AppBottomNavBar(
        itens: const [
          (icone: Icons.home_outlined, label: 'Início'),
          (icone: Icons.menu, label: 'Mais'),
        ],
        indiceAtual: 0,
        onSelecionado: (i) => tocado = i,
      ),
    );

    expect(find.text('Início'), findsOneWidget);
    await tester.tap(find.text('Mais'));
    expect(tocado, 1);
  });
}
