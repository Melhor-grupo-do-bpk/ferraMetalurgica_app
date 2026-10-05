import 'package:fera_metalurgica_app/features/orcamentos/orcamentos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_orcamento_repository.dart';

void main() {
  test(
    'MockOrcamentoRepository permite programar o retorno de getAll()',
    () async {
      final repository = MockOrcamentoRepository();
      final orcamento = Orcamento(
        id: '1',
        cliente: const Cliente(
          id: 'c1',
          nome: 'Cliente Teste',
          numero: '',
          cpfCnpj: '',
        ),
        projeto: 'Projeto Teste',
        itens: const [],
        custosOperacionais: const CustosOperacionais(),
        status: StatusOrcamento.emAnalise,
        criadoEm: DateTime(2026),
      );

      when(repository.getAll).thenAnswer((_) async => [orcamento]);

      final resultado = await repository.getAll();

      expect(resultado, [orcamento]);
    },
  );
}
