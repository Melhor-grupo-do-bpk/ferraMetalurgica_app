import 'package:fera_metalurgica_app/core/constants/app_constants.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/calculo_orcamento.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/cliente.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/custos_operacionais.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/item_orcamento.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/status_orcamento.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orcamento.freezed.dart';
part 'orcamento.g.dart';

/// A etapa 4 do wizard (resumo) é a composição das etapas 1-3: um orçamento
/// é sempre cliente + itens + custos operacionais. O valor final NUNCA é
/// digitado — é sempre calculado a partir dos custos (ver [valorFinal]).
/// Não adicione campos fora desse modelo sem alinhar com o time primeiro.
@freezed
abstract class Orcamento with _$Orcamento {
  /// Cria um [Orcamento].
  const factory Orcamento({
    /// Identificador único do orçamento (exibido como "#00482").
    required String id,

    /// Cliente para quem o orçamento é feito (etapa 1 do wizard).
    required Cliente cliente,

    /// Itens de serviço/material/medida do orçamento (etapa 2 do wizard).
    required List<ItemOrcamento> itens,

    /// Custos operacionais do serviço (etapa 3 do wizard).
    required CustosOperacionais custosOperacionais,

    /// Status atual do orçamento.
    required StatusOrcamento status,

    /// Data de criação do orçamento.
    required DateTime criadoEm,
  }) = _Orcamento;

  const Orcamento._();

  /// Cria um [Orcamento] a partir de um mapa JSON.
  factory Orcamento.fromJson(Map<String, dynamic> json) =>
      _$OrcamentoFromJson(json);

  /// Total dos custos operacionais acrescido da margem padrão.
  double get valorFinal => calcularValorFinal(
    calcularTotalCustos(custosOperacionais),
    AppConstants.margemPadraoPercentual,
  );
}
