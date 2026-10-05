import 'package:fera_metalurgica_app/core/theme/app_colors.dart';
import 'package:fera_metalurgica_app/core/widgets/status_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_themed.dart';

void main() {
  testWidgets('usa as cores do tom informado', (tester) async {
    await pumpThemed(
      tester,
      const StatusChip(label: 'Aprovado', tone: StatusTone.success),
    );

    final texto = tester.widget<Text>(find.text('Aprovado'));
    expect(texto.style?.color, AppColors.light.onSuccessContainer);
    expect(find.byKey(const ValueKey('status-chip-dot')), findsNothing);
  });

  testWidgets('mostra ponto e caixa alta quando pedido', (tester) async {
    await pumpThemed(
      tester,
      const StatusChip(label: 'Produção', showDot: true, uppercase: true),
    );

    expect(find.text('PRODUÇÃO'), findsOneWidget);
    expect(find.byKey(const ValueKey('status-chip-dot')), findsOneWidget);
  });
}
