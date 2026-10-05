import 'package:fera_metalurgica_app/core/widgets/app_top_bar.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_themed.dart';

void main() {
  testWidgets('mostra logo e sino; voltar só aparece com onBack', (
    tester,
  ) async {
    await pumpThemed(tester, const AppTopBar());

    expect(find.bySemanticsLabel('FERA'), findsOneWidget);
    expect(find.byTooltip('Notificações'), findsOneWidget);
    expect(find.byTooltip('Voltar'), findsNothing);
  });

  testWidgets('aciona os callbacks de voltar e notificações', (tester) async {
    var voltou = false;
    var notificou = false;
    await pumpThemed(
      tester,
      AppTopBar(
        onBack: () => voltou = true,
        onNotificationsPressed: () => notificou = true,
      ),
    );

    await tester.tap(find.byTooltip('Voltar'));
    await tester.tap(find.byTooltip('Notificações'));

    expect(voltou, isTrue);
    expect(notificou, isTrue);
  });
}
