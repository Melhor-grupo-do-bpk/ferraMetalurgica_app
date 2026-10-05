/// Status de um orçamento.
enum StatusOrcamento {
  /// Orçamento em elaboração/revisão interna.
  emAnalise,

  /// Orçamento enviado ao cliente, aguardando retorno.
  enviado,

  /// Orçamento aceito pelo cliente.
  aprovado,

  /// Orçamento recusado pelo cliente.
  recusado,
}
