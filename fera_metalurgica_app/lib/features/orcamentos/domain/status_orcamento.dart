import 'package:freezed_annotation/freezed_annotation.dart';

/// Status de um orçamento.
///
/// Serializado pelo NOME (ex: `"emAnalise"`), nunca pelo índice: reordenar ou
/// adicionar valores não quebra JSON já salvo. Não renomeie valores
/// existentes sem migrar os dados.
@JsonEnum()
enum StatusOrcamento {
  /// Orçamento ainda incompleto, salvo antes de concluir o wizard. Não conta
  /// nos indicadores do dashboard.
  // TODO(cliente): o wizard ainda não salva rascunho (só grava emAnalise ao
  // concluir); habilitar quando o cliente confirmar o fluxo.
  rascunho,

  /// Orçamento em elaboração/revisão interna.
  emAnalise,

  /// Orçamento enviado ao cliente, aguardando retorno.
  enviado,

  /// Orçamento aceito pelo cliente.
  aprovado,

  /// Orçamento recusado pelo cliente.
  recusado,
}
