import 'package:fera_metalurgica_app/features/cronograma/cronograma.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/fake_local_json_storage.dart';

void main() {
  late LocalCronogramaRepository repository;

  setUp(() {
    repository = LocalCronogramaRepository(InMemoryJsonStorage());
  });

  test('getAll devolve lista vazia quando nada foi salvo', () async {
    expect(await repository.getAll(), isEmpty);
  });

  test('save persiste e getAll lê de volta (ida e volta JSON)', () async {
    for (final tarefa in cronogramaSeed) {
      await repository.save(tarefa);
    }

    expect(await repository.getAll(), cronogramaSeed);
  });

  test('save com id existente substitui a tarefa', () async {
    final original = cronogramaSeed.first;
    await repository.save(original);
    await repository.save(original.copyWith(concluida: true));

    final todas = await repository.getAll();
    expect(todas, hasLength(1));
    expect(todas.single.concluida, isTrue);
  });

  test('delete remove apenas a tarefa do id informado', () async {
    for (final tarefa in cronogramaSeed) {
      await repository.save(tarefa);
    }

    await repository.delete(cronogramaSeed.first.id);

    expect(await repository.getAll(), cronogramaSeed.skip(1).toList());
  });
}
