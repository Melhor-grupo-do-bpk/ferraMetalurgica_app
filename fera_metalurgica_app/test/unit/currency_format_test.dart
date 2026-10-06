import 'package:fera_metalurgica_app/core/utils/currency_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(r'formatarMoeda usa separadores pt-BR e prefixo R$', () {
    expect(formatarMoeda(8450), r'R$ 8.450,00');
    expect(formatarMoeda(15200.5), r'R$ 15.200,50');
    expect(formatarMoeda(0), r'R$ 0,00');
  });

  test('formatarNumeroMoeda formata sem símbolo', () {
    expect(formatarNumeroMoeda(2450), '2.450,00');
    expect(formatarNumeroMoeda(1234567.89), '1.234.567,89');
  });
}
