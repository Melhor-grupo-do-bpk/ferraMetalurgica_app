import 'package:fera_metalurgica_app/core/widgets/filter_chips_bar.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_themed.dart';

void main() {
  testWidgets('mostra as opções e informa o índice tocado', (tester) async {
    int? tocado;
    await pumpThemed(
      tester,
      FilterChipsBar(
        opcoes: const ['Todos', 'Enviados', 'Aprovados'],
        selecionado: 0,
        onSelecionado: (i) => tocado = i,
      ),
    );

    expect(find.text('Todos'), findsOneWidget);
    expect(find.text('Enviados'), findsOneWidget);
    expect(
      tester.getSemantics(find.text('Todos')),
      matchesSemantics(
        label: 'Todos',
        isSelected: true,
        isButton: true,
        hasSelectedState: true,
        hasTapAction: true,
        isFocusable: true,
        hasFocusAction: true,
      ),
    );

    await tester.tap(find.text('Aprovados'));
    expect(tocado, 2);
  });
}
