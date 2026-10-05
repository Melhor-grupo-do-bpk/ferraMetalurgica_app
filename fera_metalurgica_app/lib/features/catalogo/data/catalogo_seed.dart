import 'package:fera_metalurgica_app/features/catalogo/domain/produto_catalogo.dart';

/// Produtos de exemplo, com nomes e descrições da tela "Catálogo de
/// Produtos" do Figma. As categorias não aparecem no Figma e são
/// provisórias.
const List<ProdutoCatalogo> catalogoSeed = [
  ProdutoCatalogo(
    id: 'produto-portao-basculante',
    nome: 'Portão Basculante',
    categoria: 'Portões',
    descricaoTecnica:
        'Sistema de abertura vertical otimizado para espaços reduzidos. '
        'Fabricado em aço galvanizado de alta resistência com contrapesos '
        'embutidos.',
  ),
  ProdutoCatalogo(
    id: 'produto-estrutura-trelicada',
    nome: 'Estrutura Treliçada',
    categoria: 'Estruturas',
    descricaoTecnica:
        'Vigas em treliça ideais para grandes vãos livres. Proporciona '
        'excelente relação peso-resistência para galpões e coberturas '
        'industriais.',
  ),
  ProdutoCatalogo(
    id: 'produto-grade-protecao-pesada',
    nome: 'Grade de Proteção Pesada',
    categoria: 'Grades',
    descricaoTecnica:
        'Módulos de gradeamento para segurança perimetral de alto nível. '
        'Solda MIG contínua e pintura eletrostática texturizada.',
  ),
];
