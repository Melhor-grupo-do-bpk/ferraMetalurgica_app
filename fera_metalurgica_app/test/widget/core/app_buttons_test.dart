import 'package:fera_metalurgica_app/core/theme/app_colors.dart';
import 'package:fera_metalurgica_app/core/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_themed.dart';

void main() {
  testWidgets('PrimaryButton usa a cor primária e aciona onPressed', (
    tester,
  ) async {
    var tocou = false;
    await pumpThemed(
      tester,
      PrimaryButton(
        label: 'Criar orçamento',
        icon: Icons.add,
        large: true,
        onPressed: () => tocou = true,
      ),
    );

    final material = tester.widget<Material>(
      find.descendant(
        of: find.byType(FilledButton),
        matching: find.byType(Material),
      ),
    );
    expect(material.color, AppColors.light.primary);

    await tester.tap(find.text('Criar orçamento'));
    expect(tocou, isTrue);
  });

  testWidgets('OutlinedAppButton aciona onPressed', (tester) async {
    var tocou = false;
    await pumpThemed(
      tester,
      OutlinedAppButton(
        label: 'Adicionar Item',
        icon: Icons.add,
        onPressed: () => tocou = true,
      ),
    );

    await tester.tap(find.text('Adicionar Item'));
    expect(tocou, isTrue);
  });

  testWidgets('DarkButton usa a superfície escura do tema', (tester) async {
    await pumpThemed(tester, DarkButton(label: 'Novo', onPressed: () {}));

    final material = tester.widget<Material>(
      find.descendant(
        of: find.byType(FilledButton),
        matching: find.byType(Material),
      ),
    );
    expect(material.color, AppColors.light.darkSurface);
  });
}
