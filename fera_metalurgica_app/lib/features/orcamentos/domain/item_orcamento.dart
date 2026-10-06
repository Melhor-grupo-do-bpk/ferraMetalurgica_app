import 'package:fera_metalurgica_app/features/orcamentos/domain/medidas.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_orcamento.freezed.dart';
part 'item_orcamento.g.dart';

/// Etapa 2 do wizard de orçamento: um item de serviço/material/medida.
///
/// Itens são descritivos (o que será fabricado e em que quantidade); eles
/// não entram no valor final, que vem dos custos operacionais.
///
/// `produtoId` referencia opcionalmente um item do catálogo
/// (`ProdutoCatalogo`), quando o item parte de uma estrutura pré-cadastrada.
@freezed
abstract class ItemOrcamento with _$ItemOrcamento {
  /// Cria um [ItemOrcamento].
  const factory ItemOrcamento({
    /// Identificador único do item.
    required String id,

    /// Tipo do serviço (ex: "Portão metálico basculante").
    required String tipoServico,

    /// Medidas do item, em metros.
    @Default(Medidas()) Medidas medidas,

    /// Material principal (ex: "Aço Carbono").
    String? materialPrincipal,

    /// Especificações técnicas / observações (acabamento, pintura etc.).
    String? especificacoes,

    /// Quantidade de unidades do item.
    @Default(1) int quantidade,

    /// Identificador do produto do catálogo de origem, quando houver.
    String? produtoId,
  }) = _ItemOrcamento;

  /// Cria um [ItemOrcamento] a partir de um mapa JSON.
  factory ItemOrcamento.fromJson(Map<String, dynamic> json) =>
      _$ItemOrcamentoFromJson(json);
}
