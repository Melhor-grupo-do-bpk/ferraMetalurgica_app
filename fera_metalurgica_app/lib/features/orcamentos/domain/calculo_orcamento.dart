import 'package:fera_metalurgica_app/features/orcamentos/domain/custos_operacionais.dart';

/// Soma de todos os custos operacionais.
double calcularTotalCustos(CustosOperacionais custos) =>
    custos.materiaPrima +
    custos.maoDeObra +
    custos.insumos +
    custos.combustivel +
    custos.impostos;

/// Valor final cobrado do cliente: [totalCustos] acrescido de
/// [margemPercentual] (ex: `62.5` → total × 1,625).
double calcularValorFinal(double totalCustos, double margemPercentual) =>
    totalCustos * (1 + margemPercentual / 100);
