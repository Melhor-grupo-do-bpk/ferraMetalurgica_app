import 'package:intl/intl.dart';

final NumberFormat _numeroPtBr = NumberFormat('#,##0.00', 'pt_BR');

/// Formata [valor] no padrão pt-BR sem símbolo (ex: `8450` → `8.450,00`).
String formatarNumeroMoeda(double valor) => _numeroPtBr.format(valor);

/// Formata [valor] como moeda pt-BR (ex: `8450` → `R$ 8.450,00`).
String formatarMoeda(double valor) => 'R\$ ${formatarNumeroMoeda(valor)}';
