import 'package:fera_metalurgica_app/core/theme/app_colors.dart';
import 'package:fera_metalurgica_app/core/theme/app_spacing.dart';
import 'package:fera_metalurgica_app/core/theme/app_text_styles.dart';
import 'package:fera_metalurgica_app/core/widgets/app_top_bar.dart';
import 'package:flutter/material.dart';

/// Tela provisória das abas cujas features ainda não foram implementadas.
class PlaceholderPage extends StatelessWidget {
  /// Cria a tela com o [titulo] da aba.
  const PlaceholderPage({required this.titulo, super.key});

  /// Título exibido no centro da tela.
  final String titulo;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      appBar: const AppTopBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                titulo,
                style: AppTextStyles.headline.copyWith(
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Em construção',
                style: AppTextStyles.label.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
