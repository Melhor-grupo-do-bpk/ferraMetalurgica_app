import 'package:fera_metalurgica_app/core/theme/app_colors.dart';
import 'package:fera_metalurgica_app/core/theme/app_spacing.dart';
import 'package:fera_metalurgica_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Faixa horizontal rolável de chips de filtro com seleção única
/// (ex: "Todos", "Enviados", "Aprovados" na lista de orçamentos).
class FilterChipsBar extends StatelessWidget {
  /// Cria a faixa com [opcoes], destacando [selecionado].
  const FilterChipsBar({
    required this.opcoes,
    required this.selecionado,
    required this.onSelecionado,
    super.key,
  });

  /// Rótulos dos chips, na ordem de exibição.
  final List<String> opcoes;

  /// Índice do chip selecionado.
  final int selecionado;

  /// Chamado com o índice do chip tocado.
  final ValueChanged<int> onSelecionado;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < opcoes.length; i++) ...[
            if (i > 0) const SizedBox(width: AppSpacing.xs),
            _Chip(
              label: opcoes[i],
              selected: i == selecionado,
              colors: colors,
              onTap: () => onSelecionado(i),
            ),
          ],
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.selected,
    required this.colors,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final AppColors colors;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final shape = StadiumBorder(
      side: BorderSide(color: selected ? colors.brand : colors.border),
    );
    return Semantics(
      selected: selected,
      button: true,
      child: Material(
        color: selected ? colors.brand : colors.surface,
        shape: shape,
        child: InkWell(
          customBorder: shape,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs - 1,
            ),
            child: Text(
              label,
              style: AppTextStyles.labelMedium.copyWith(
                color: selected ? colors.onBrand : colors.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
