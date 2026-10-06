import 'package:fera_metalurgica_app/core/constants/app_constants.dart';
import 'package:fera_metalurgica_app/core/di/local_storage_provider.dart';
import 'package:fera_metalurgica_app/core/utils/local_json_storage.dart';
import 'package:fera_metalurgica_app/features/cronograma/domain/cronograma_repository.dart';
import 'package:fera_metalurgica_app/features/cronograma/domain/tarefa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cronograma_repository_impl.g.dart';

/// Implementação de [CronogramaRepository] baseada em arquivo JSON local.
class LocalCronogramaRepository implements CronogramaRepository {
  /// Cria um [LocalCronogramaRepository] sobre o [LocalJsonStorage] dado.
  const LocalCronogramaRepository(this._storage);

  final LocalJsonStorage _storage;

  @override
  Future<List<Tarefa>> getAll() async {
    final raw = await _storage.readList(AppConstants.tarefasFileName);
    return raw.map(Tarefa.fromJson).toList();
  }

  @override
  Future<void> save(Tarefa tarefa) async {
    final tarefas = await getAll();
    final index = tarefas.indexWhere((t) => t.id == tarefa.id);

    if (index == -1) {
      tarefas.add(tarefa);
    } else {
      tarefas[index] = tarefa;
    }

    await _storage.writeList(
      AppConstants.tarefasFileName,
      tarefas.map((t) => t.toJson()).toList(),
    );
  }

  @override
  Future<void> delete(String id) async {
    final tarefas = await getAll()
      ..removeWhere((t) => t.id == id);

    await _storage.writeList(
      AppConstants.tarefasFileName,
      tarefas.map((t) => t.toJson()).toList(),
    );
  }
}

/// Provider do [CronogramaRepository] usado pela feature `cronograma`.
@riverpod
CronogramaRepository cronogramaRepository(Ref ref) {
  return LocalCronogramaRepository(ref.watch(localJsonStorageProvider));
}
