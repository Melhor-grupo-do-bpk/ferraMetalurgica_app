import 'package:freezed_annotation/freezed_annotation.dart';

part 'cliente.freezed.dart';
part 'cliente.g.dart';

/// Etapa 1 do wizard de orçamento: dados do cliente.
@freezed
abstract class Cliente with _$Cliente {
  /// Cria um [Cliente].
  const factory Cliente({
    /// Identificador único do cliente.
    required String id,

    /// Nome do cliente ou da empresa contratante.
    required String nome,

    /// Telefone de contato do cliente.
    required String telefone,

    /// E-mail de contato do cliente, quando informado.
    String? email,

    /// Endereço do cliente/obra, quando informado.
    String? endereco,
  }) = _Cliente;

  /// Cria um [Cliente] a partir de um mapa JSON.
  factory Cliente.fromJson(Map<String, dynamic> json) =>
      _$ClienteFromJson(json);
}
