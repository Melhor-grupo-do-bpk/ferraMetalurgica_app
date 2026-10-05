import 'package:fera_metalurgica_app/features/orcamentos/domain/orcamento.dart';

/// Contrato de persistência de orçamentos.
///
/// Não crie uma segunda implementação/local de acesso a orçamentos: toda
/// leitura/escrita de orçamentos passa por aqui.
abstract class OrcamentoRepository {
  /// Retorna todos os orçamentos salvos.
  Future<List<Orcamento>> getAll();

  /// Cria ou atualiza um orçamento.
  Future<void> save(Orcamento orcamento);

  /// Remove o orçamento de identificador [id].
  Future<void> delete(String id);
}
