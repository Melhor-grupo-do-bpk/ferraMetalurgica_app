import 'package:fera_metalurgica_app/features/orcamentos/domain/cliente.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/custos_operacionais.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/item_orcamento.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/medidas.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/orcamento.dart';
import 'package:fera_metalurgica_app/features/orcamentos/domain/status_orcamento.dart';

/// Orçamentos de exemplo, com os nomes e valores das telas do Figma.
///
/// #00482 reproduz exatamente o fluxo do wizard (custos R$ 5.200,00 →
/// valor final R$ 8.450,00; item, medidas, material e prazo das etapas 2 e
/// 4). #00481 aparece só na lista do Figma com valor final R$ 12.300,00; a
/// divisão dos custos e o projeto dele são fictícios. Números de telefone e
/// documentos são os placeholders do Figma ou fictícios.
final List<Orcamento> orcamentosSeed = [
  Orcamento(
    id: '00482',
    cliente: const Cliente(
      id: 'cliente-joao-da-silva',
      nome: 'João da Silva',
      numero: '(99) 99999-9999',
      cpfCnpj: '123.456.789-00',
    ),
    projeto: 'Portão metálico',
    itens: const [
      ItemOrcamento(
        id: 'item-00482-1',
        tipoServico: 'Portão metálico basculante',
        medidas: Medidas(altura: 2.5, largura: 2.2),
        materialPrincipal: 'Aço Carbono',
        especificacoes: 'Estrutura tubular 50×50mm, chapa 18',
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
      numero: '(99) 99999-9999',
      cpfCnpj: '12.345.678/0001-90',
    ),
    projeto: 'Estrutura treliçada',
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
