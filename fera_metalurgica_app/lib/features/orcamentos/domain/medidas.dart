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

  const Medidas._();

  /// Cria um [Medidas] a partir de um mapa JSON.
  factory Medidas.fromJson(Map<String, dynamic> json) =>
      _$MedidasFromJson(json);

  /// Medidas preenchidas, na ordem A x L x C (ex: `"2.50m x 2.20m"`), ou
  /// string vazia quando nenhuma foi informada.
  String get formatada => [
    altura,
    largura,
    comprimento,
  ].whereType<double>().map((m) => '${m.toStringAsFixed(2)}m').join(' x ');
}
