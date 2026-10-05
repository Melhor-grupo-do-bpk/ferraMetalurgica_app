import 'package:freezed_annotation/freezed_annotation.dart';

part 'custos_operacionais.freezed.dart';
part 'custos_operacionais.g.dart';

/// Etapa 3 do wizard de orçamento: custos operacionais do serviço.
///
/// O total é calculado por `calcularTotalCustos` (ver
/// `calculo_orcamento.dart`), não por um campo gravável.
@freezed
abstract class CustosOperacionais with _$CustosOperacionais {
  /// Cria um [CustosOperacionais].
  const factory CustosOperacionais({
    /// Custo com matéria-prima.
    @Default(0) double materiaPrima,

    /// Custo com mão de obra.
    @Default(0) double maoDeObra,

    /// Custo com insumos (consumíveis de fabricação).
    @Default(0) double insumos,

    /// Custo com combustível/deslocamento.
    @Default(0) double combustivel,

    /// Impostos incidentes sobre o serviço.
    @Default(0) double impostos,
  }) = _CustosOperacionais;

  /// Cria um [CustosOperacionais] a partir de um mapa JSON.
  factory CustosOperacionais.fromJson(Map<String, dynamic> json) =>
      _$CustosOperacionaisFromJson(json);
}
