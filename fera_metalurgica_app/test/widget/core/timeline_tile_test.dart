import 'package:fera_metalurgica_app/core/widgets/status_chip.dart';
import 'package:fera_metalurgica_app/core/widgets/timeline_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_themed.dart';

void main() {
  testWidgets('mostra horário, título, descrição, tag e linha', (tester) async {
    await pumpThemed(
      tester,
      const TimelineTile(
        horario: '09:00',
        titulo: 'Revisar orçamento #00482',
        descricao: 'Cliente: Indústrias Apex S/A',
        tag: StatusChip(label: 'Orçamento', uppercase: true),
      ),
    );

    expect(find.text('09:00'), findsOneWidget);
    expect(find.text('Revisar orçamento #00482'), findsOneWidget);
    expect(find.text('Cliente: Indústrias Apex S/A'), findsOneWidget);
    expect(find.text('ORÇAMENTO'), findsOneWidget);
    expect(find.byKey(const ValueKey('timeline-line')), findsOneWidget);
  });

  testWidgets('tarefa concluída fica riscada, com check e sem tag', (
    tester,
  ) async {
    await pumpThemed(
      tester,
      const TimelineTile(
        horario: '11:30',
        titulo: 'Manutenção preventiva',
        tag: StatusChip(label: 'Produção'),
        concluida: true,
        ultimo: true,
      ),
    );

    final titulo = tester.widget<Text>(find.text('Manutenção preventiva'));
    expect(titulo.style?.decoration, TextDecoration.lineThrough);
    expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);
    expect(find.text('Produção'), findsNothing);
    expect(find.byKey(const ValueKey('timeline-line')), findsNothing);
  });
}
