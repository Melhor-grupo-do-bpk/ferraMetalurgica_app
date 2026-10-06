import 'dart:convert';

import 'package:fera_metalurgica_app/features/orcamentos/orcamentos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('campos opcionais assumem os padrões quando ausentes no JSON', () {
    final orcamento = Orcamento.fromJson({
      'id': '1',
      'cliente': {
        'id': 'c1',
        'nome': 'João da Silva',
        'numero': '(99) 99999-9999',
        'cpfCnpj': '123.456.789-00',
      },
      'projeto': 'Portão metálico',
      'itens': [
        {'id': 'i1', 'tipoServico': 'Portão metálico basculante'},
      ],
      'custosOperacionais': <String, dynamic>{},
      'status': 'emAnalise',
      'criadoEm': '2026-08-17T00:00:00.000',
    });

    expect(orcamento.prazoDiasUteis, 15);
    expect(orcamento.cliente.email, isNull);
    expect(orcamento.cliente.observacoes, isNull);

    final item = orcamento.itens.single;
    expect(item.quantidade, 1);
    expect(item.medidas, const Medidas());
    expect(item.materialPrincipal, isNull);
    expect(item.especificacoes, isNull);
  });

  test('status é serializado pelo nome, não pelo índice', () {
    final original = orcamentosSeed.first.copyWith(
      status: StatusOrcamento.rascunho,
    );

    final json = jsonDecode(jsonEncode(original)) as Map<String, dynamic>;
    expect(json['status'], 'rascunho');
    expect(Orcamento.fromJson(json).status, StatusOrcamento.rascunho);

    // JSON gravado antes de existir `rascunho` continua lendo o mesmo status.
    final antigo = {...json, 'status': 'aprovado'};
    expect(Orcamento.fromJson(antigo).status, StatusOrcamento.aprovado);
  });

  test('ida e volta JSON preserva medidas, material e especificações', () {
    final original = orcamentosSeed.firstWhere((o) => o.id == '00482');

    final json = jsonDecode(jsonEncode(original)) as Map<String, dynamic>;
    final lido = Orcamento.fromJson(json);

    expect(lido, original);
    expect(lido.projeto, 'Portão metálico');
    expect(lido.itens.single.medidas.altura, 2.5);
    expect(lido.itens.single.medidas.comprimento, isNull);
  });
}
