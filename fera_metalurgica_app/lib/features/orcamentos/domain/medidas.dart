import 'package:freezed_annotation/freezed_annotation.dart';

part 'medidas.freezed.dart';
part 'medidas.g.dart';

/// Medidas de um item do orçamento, em metros (campos A, L e C do Figma).
/// Todas são opcionais.
@freezed
abstract class Medidas with _$Medidas {
  /// Cria um [Medidas].
  const factory Medidas({
    /// Altura (A), em metros.
    double? altura,

    /// Largura (L), em metros.
    double? largura,

    /// Comprimento (C), em metros.
    double? comprimento,
  }) = _Medidas;

  /// Cria um [Medidas] a partir de um mapa JSON.
  factory Medidas.fromJson(Map<String, dynamic> json) =>
      _$MedidasFromJson(json);
}
