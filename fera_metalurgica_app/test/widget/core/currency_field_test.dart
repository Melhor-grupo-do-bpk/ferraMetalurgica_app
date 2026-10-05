import 'package:fera_metalurgica_app/core/widgets/currency_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'pump_themed.dart';

void main() {
  testWidgets(r'exibe prefixo R$ e valor inicial formatado à direita', (
    tester,
  ) async {
    await pumpThemed(tester, const CurrencyField(valorInicial: 2450));

    expect(find.text(r'R$'), findsOneWidget);
    expect(find.text('2.450,00'), findsOneWidget);
    final field = tester.widget<TextField>(find.byType(TextField));
    expect(field.textAlign, TextAlign.right);
  });

  testWidgets('formata a digitação em pt-BR e devolve o valor em reais', (
    tester,
  ) async {
    double? valor;
    await pumpThemed(tester, CurrencyField(onChanged: (v) => valor = v));

    await tester.enterText(find.byType(TextField), '180000');

    expect(find.text('1.800,00'), findsOneWidget);
    expect(valor, 1800);
  });
}
