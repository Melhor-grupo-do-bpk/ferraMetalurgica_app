/// App-wide constants shared across features.
class AppConstants {
  const AppConstants._();

  /// Display name of the app.
  static const String appName = 'FERA';

  /// File name used to persist the list of orçamentos (LocalJsonStorage).
  static const String orcamentosFileName = 'orcamentos';

  /// File name used to persist the list of produtos do catálogo.
  static const String catalogoFileName = 'catalogo';

  /// File name used to persist the list of tarefas do cronograma.
  static const String tarefasFileName = 'tarefas';

  // TODO(cliente): confirmar como a margem entra.
  /// Margem padrão (%) aplicada sobre o total dos custos operacionais para
  /// chegar ao valor final do orçamento.
  ///
  /// Decisão provisória: 62,5% reproduz o exemplo do Figma
  /// (custos R$ 5.200,00 → valor final R$ 8.450,00).
  static const double margemPadraoPercentual = 62.5;
}
