import 'package:fera_metalurgica_app/features/catalogo/domain/produto_catalogo.dart';

/// Contrato de persistência do catálogo de produtos.
///
/// Não crie uma segunda implementação/local de acesso ao catálogo: toda
/// leitura/escrita de produtos passa por aqui.
abstract class CatalogoRepository {
  /// Retorna todos os produtos do catálogo.
  Future<List<ProdutoCatalogo>> getAll();

  /// Cria ou atualiza um produto do catálogo.
  Future<void> save(ProdutoCatalogo produto);

  /// Remove o produto de identificador [id].
  Future<void> delete(String id);
}
