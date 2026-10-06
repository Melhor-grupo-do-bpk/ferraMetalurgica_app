import 'package:fera_metalurgica_app/core/constants/app_constants.dart';
import 'package:fera_metalurgica_app/core/di/local_storage_provider.dart';
import 'package:fera_metalurgica_app/core/utils/local_json_storage.dart';
import 'package:fera_metalurgica_app/features/catalogo/domain/catalogo_repository.dart';
import 'package:fera_metalurgica_app/features/catalogo/domain/produto_catalogo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'catalogo_repository_impl.g.dart';

/// Implementação de [CatalogoRepository] baseada em arquivo JSON local.
class LocalCatalogoRepository implements CatalogoRepository {
  /// Cria um [LocalCatalogoRepository] sobre o [LocalJsonStorage] dado.
  const LocalCatalogoRepository(this._storage);

  final LocalJsonStorage _storage;

  @override
  Future<List<ProdutoCatalogo>> getAll() async {
    final raw = await _storage.readList(AppConstants.catalogoFileName);
    return raw.map(ProdutoCatalogo.fromJson).toList();
  }

  @override
  Future<void> save(ProdutoCatalogo produto) async {
    final produtos = await getAll();
    final index = produtos.indexWhere((p) => p.id == produto.id);

    if (index == -1) {
      produtos.add(produto);
    } else {
      produtos[index] = produto;
    }

    await _storage.writeList(
      AppConstants.catalogoFileName,
      produtos.map((p) => p.toJson()).toList(),
    );
  }

  @override
  Future<void> delete(String id) async {
    final produtos = await getAll()
      ..removeWhere((p) => p.id == id);

    await _storage.writeList(
      AppConstants.catalogoFileName,
      produtos.map((p) => p.toJson()).toList(),
    );
  }
}

/// Provider do [CatalogoRepository] usado pela feature `catalogo`.
@riverpod
CatalogoRepository catalogoRepository(Ref ref) {
  return LocalCatalogoRepository(ref.watch(localJsonStorageProvider));
}
