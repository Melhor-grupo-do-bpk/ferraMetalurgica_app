import 'package:freezed_annotation/freezed_annotation.dart';

part 'produto_catalogo.freezed.dart';
part 'produto_catalogo.g.dart';

/// Item do catálogo de produtos/estruturas da empresa.
@freezed
abstract class ProdutoCatalogo with _$ProdutoCatalogo {
  /// Cria um [ProdutoCatalogo].
  const factory ProdutoCatalogo({
    /// Identificador único do produto.
    required String id,

    /// Nome do produto/estrutura.
    required String nome,

    /// Categoria do produto (ex: "Portão basculante", "Grade de proteção").
    required String categoria,

    /// Descrição técnica do produto.
    required String descricaoTecnica,

    /// Caminho local da foto do produto, quando houver.
    String? fotoPath,
  }) = _ProdutoCatalogo;

  /// Cria um [ProdutoCatalogo] a partir de um mapa JSON.
  factory ProdutoCatalogo.fromJson(Map<String, dynamic> json) =>
      _$ProdutoCatalogoFromJson(json);
}
