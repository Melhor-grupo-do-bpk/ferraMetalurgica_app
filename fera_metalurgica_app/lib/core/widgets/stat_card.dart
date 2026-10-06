import 'package:fera_metalurgica_app/core/theme/app_colors.dart';
import 'package:fera_metalurgica_app/core/theme/app_spacing.dart';
import 'package:fera_metalurgica_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Card de indicador do dashboard (ex: "Aprovados — 45").
class StatCard extends StatelessWidget {
  /// Cria o indicador.
  const StatCard({
    required this.label,
    required this.valor,
    required this.icone,
    this.onTap,
    super.key,
  });

  /// Descrição do indicador.
  final String label;

  /// Valor exibido (já formatado, ex: "08").
  final String valor;

  /// Ícone do canto inferior direito.
  final IconData icone;

  /// Ação ao tocar no card.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = BorderRadius.circular(AppSpacing.radiusMd);
    return Material(
      color: colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(color: colors.border),
      ),
      child: InkWell(
        borderRadius: radius,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: AppTextStyles.label.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      valor,
                      style: AppTextStyles.statValue.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                  ),
                  Icon(icone, size: 20, color: colors.textSecondary),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
