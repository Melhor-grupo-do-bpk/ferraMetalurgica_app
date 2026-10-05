import 'package:fera_metalurgica_app/core/constants/app_constants.dart';
import 'package:fera_metalurgica_app/core/di/local_storage_provider.dart';
import 'package:fera_metalurgica_app/core/utils/local_json_storage.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/orcamento.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/orcamento_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orcamento_repository_impl.g.dart';

/// Implementação de [OrcamentoRepository] baseada em arquivo JSON local.
class LocalOrcamentoRepository implements OrcamentoRepository {
  /// Cria um [LocalOrcamentoRepository] sobre o [LocalJsonStorage] dado.
  const LocalOrcamentoRepository(this._storage);

  final LocalJsonStorage _storage;

  @override
  Future<List<Orcamento>> getAll() async {
    final raw = await _storage.readList(AppConstants.orcamentosFileName);
    return raw.map(Orcamento.fromJson).toList();
  }

  @override
  Future<void> save(Orcamento orcamento) async {
    final orcamentos = await getAll();
    final index = orcamentos.indexWhere((o) => o.id == orcamento.id);

    if (index == -1) {
      orcamentos.add(orcamento);
    } else {
      orcamentos[index] = orcamento;
    }

    await _storage.writeList(
      AppConstants.orcamentosFileName,
      orcamentos.map((o) => o.toJson()).toList(),
    );
  }

  @override
  Future<void> delete(String id) async {
    final orcamentos = await getAll()
      ..removeWhere((o) => o.id == id);

    await _storage.writeList(
      AppConstants.orcamentosFileName,
      orcamentos.map((o) => o.toJson()).toList(),
    );
  }
}

/// Provider do [OrcamentoRepository] usado pela feature `orcamentos`.
@riverpod
OrcamentoRepository orcamentoRepository(Ref ref) {
  return LocalOrcamentoRepository(ref.watch(localJsonStorageProvider));
}
