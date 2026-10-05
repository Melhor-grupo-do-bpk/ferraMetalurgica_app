import 'package:fera_metalurgica_app/core/theme/app_colors.dart';
import 'package:fera_metalurgica_app/core/theme/app_spacing.dart';
import 'package:fera_metalurgica_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Card de seção com cabeçalho opcional (ícone + título em caixa alta),
/// como "MATÉRIA-PRIMA" (custos) ou "CLIENTE" (resumo) no Figma.
class SectionCard extends StatelessWidget {
  /// Cria o card envolvendo [child].
  const SectionCard({required this.child, this.titulo, this.icone, super.key});

  /// Título do cabeçalho; exibido em caixa alta.
  final String? titulo;

  /// Ícone exibido antes do [titulo].
  final IconData? icone;

  /// Conteúdo do card.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md + AppSpacing.xxs),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (titulo != null) ...[
            Row(
              children: [
                if (icone != null) ...[
                  Icon(icone, size: 20, color: colors.textSecondary),
                  const SizedBox(width: AppSpacing.xs),
                ],
                Flexible(
                  child: Text(
                    titulo!.toUpperCase(),
                    style: AppTextStyles.labelMedium.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
          ],
          child,
        ],
      ),
    );
  }
}
