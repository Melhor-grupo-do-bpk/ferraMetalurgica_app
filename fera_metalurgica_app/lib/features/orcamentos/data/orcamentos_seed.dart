import 'package:fera_metalurgica_app/features/orcamentos/domain/cliente.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/custos_operacionais.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/item_orcamento.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/orcamento.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/status_orcamento.dart';

/// Orçamentos de exemplo, com os nomes e valores das telas do Figma.
///
/// #00482 reproduz exatamente o fluxo do wizard (custos R$ 5.200,00 →
/// valor final R$ 8.450,00). #00481 aparece só na lista do Figma com
/// valor final R$ 12.300,00; a divisão dos custos dele é fictícia,
/// escolhida para resultar nesse valor com a margem padrão.
final List<Orcamento> orcamentosSeed = [
  Orcamento(
    id: '00482',
    cliente: const Cliente(
      id: 'cliente-joao-da-silva',
      nome: 'João da Silva',
      telefone: '',
    ),
    itens: const [
      ItemOrcamento(
        id: 'item-00482-1',
        descricao:
            'Portão metálico basculante — Estrutura tubular 50×50mm, chapa 18',
        quantidade: 1,
        produtoId: 'produto-portao-basculante',
      ),
    ],
    custosOperacionais: const CustosOperacionais(
      materiaPrima: 2450,
      maoDeObra: 1800,
      insumos: 350,
      combustivel: 180,
      impostos: 420,
    ),
    status: StatusOrcamento.emAnalise,
    criadoEm: DateTime(2026, 8, 17),
  ),
  Orcamento(
    id: '00481',
    cliente: const Cliente(
      id: 'cliente-metalurgica-abc',
      nome: 'Metalúrgica ABC Ltda',
      telefone: '',
    ),
    itens: const [],
    custosOperacionais: const CustosOperacionais(
      materiaPrima: 3800,
      maoDeObra: 2500,
      insumos: 600,
      combustivel: 219.23,
      impostos: 450,
    ),
    status: StatusOrcamento.aprovado,
    criadoEm: DateTime(2026, 8, 15),
  ),
];
