import 'package:fera_metalurgica_app/features/catalogo/catalogo.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/fake_local_json_storage.dart';

void main() {
  late LocalCatalogoRepository repository;

  setUp(() {
    repository = LocalCatalogoRepository(InMemoryJsonStorage());
  });

  test('getAll devolve lista vazia quando nada foi salvo', () async {
    expect(await repository.getAll(), isEmpty);
  });

  test('save persiste e getAll lê de volta (ida e volta JSON)', () async {
    for (final produto in catalogoSeed) {
      await repository.save(produto);
    }

    expect(await repository.getAll(), catalogoSeed);
  });

  test('save com id existente substitui o produto', () async {
    final original = catalogoSeed.first;
    await repository.save(original);
    await repository.save(original.copyWith(fotoPath: 'portao.jpg'));

    final todos = await repository.getAll();
    expect(todos, hasLength(1));
    expect(todos.single.fotoPath, 'portao.jpg');
  });

  test('delete remove apenas o produto do id informado', () async {
    for (final produto in catalogoSeed) {
      await repository.save(produto);
    }

    await repository.delete(catalogoSeed.first.id);

    expect(await repository.getAll(), catalogoSeed.skip(1).toList());
  });
}
