import 'package:fera_metalurgica_app/core/constants/app_constants.dart';
import 'package:fera_metalurgica_app/core/utils/currency_format.dart';
import 'package:fera_metalurgica_app/features/orcamentos/orcamentos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Exemplo do Figma (Novo Orçamento - Custos / Resumo).
  const custosFigma = CustosOperacionais(
    materiaPrima: 2450,
    maoDeObra: 1800,
    insumos: 350,
    combustivel: 180,
    impostos: 420,
  );

  group('calcularTotalCustos', () {
    test(r'soma os cinco custos do exemplo do Figma em R$ 5.200', () {
      expect(calcularTotalCustos(custosFigma), 5200);
    });

    test('é zero quando não há custos', () {
      expect(calcularTotalCustos(const CustosOperacionais()), 0);
    });
  });

  group('calcularValorFinal', () {
    test(r'com a margem padrão leva R$ 5.200 a R$ 8.450', () {
      final valor = calcularValorFinal(
        5200,
        AppConstants.margemPadraoPercentual,
      );

      expect(valor, closeTo(8450, 0.001));
      expect(formatarMoeda(valor), r'R$ 8.450,00');
    });

    test('sem margem devolve o próprio total de custos', () {
      expect(calcularValorFinal(5200, 0), 5200);
    });
  });

  group('Orcamento.valorFinal', () {
    test('aplica a margem padrão sobre o total dos custos', () {
      final orcamento = orcamentosSeed.firstWhere((o) => o.id == '00482');

      expect(orcamento.custosOperacionais, custosFigma);
      expect(orcamento.valorFinal, closeTo(8450, 0.001));
    });

    test('seed #00481 exibe o valor da lista do Figma', () {
      final orcamento = orcamentosSeed.firstWhere((o) => o.id == '00481');

      expect(formatarMoeda(orcamento.valorFinal), r'R$ 12.300,00');
    });
  });
}
