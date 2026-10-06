import 'package:fera_metalurgica_app/core/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_themed.dart';

void main() {
  testWidgets('mostra os dados e aciona editar/excluir', (tester) async {
    var editou = false;
    var excluiu = false;
    await pumpThemed(
      tester,
      ItemCard(
        rotulo: 'Item 01',
        titulo: 'Portão Metálico Basculante',
        detalhes: const [(Icons.straighten, '2.50m x 2.20m')],
        rodape: 'Qtd: 1 un',
        onEditar: () => editou = true,
        onExcluir: () => excluiu = true,
      ),
    );

    expect(find.text('Item 01'), findsOneWidget);
    expect(find.text('Portão Metálico Basculante'), findsOneWidget);
    expect(find.text('2.50m x 2.20m'), findsOneWidget);
    expect(find.text('Qtd: 1 un'), findsOneWidget);

    await tester.tap(find.byTooltip('Editar'));
    await tester.tap(find.byTooltip('Excluir'));
    expect(editou, isTrue);
    expect(excluiu, isTrue);
  });

  testWidgets('esconde as ações sem callbacks', (tester) async {
    await pumpThemed(
      tester,
      const ItemCard(rotulo: 'Item 01', titulo: 'Grade'),
    );

    expect(find.byTooltip('Editar'), findsNothing);
    expect(find.byTooltip('Excluir'), findsNothing);
  });
}
