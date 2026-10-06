import 'package:fera_metalurgica_app/core/theme/app_colors.dart';
import 'package:fera_metalurgica_app/core/theme/app_spacing.dart';
import 'package:fera_metalurgica_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Botão principal laranja ("Continuar", "Criar orçamento").
class PrimaryButton extends StatelessWidget {
  /// Cria o botão. [large] usa o estilo do CTA do dashboard (largura total,
  /// texto 16 bold, raio 12).
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.trailingIcon,
    this.large = false,
    super.key,
  });

  /// Texto do botão.
  final String label;

  /// Ação; `null` desabilita o botão.
  final VoidCallback? onPressed;

  /// Ícone antes do texto.
  final IconData? icon;

  /// Ícone depois do texto (ex: seta de "Continuar").
  final IconData? trailingIcon;

  /// Estilo grande, de largura total.
  final bool large;

  @override
  Widget build(BuildContext context) {
    final button = FilledButton(
      onPressed: onPressed,
      style: large
          ? FilledButton.styleFrom(
              textStyle: AppTextStyles.buttonLarge,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
            )
          : null,
      child: _ButtonContent(
        label: label,
        icon: icon,
        trailingIcon: trailingIcon,
      ),
    );
    return large ? SizedBox(width: double.infinity, child: button) : button;
  }
}

/// Botão com contorno ("Adicionar Item").
class OutlinedAppButton extends StatelessWidget {
  /// Cria o botão.
  const OutlinedAppButton({
    required this.label,
    required this.onPressed,
    this.icon,
    super.key,
  });

  /// Texto do botão.
  final String label;

  /// Ação; `null` desabilita o botão.
  final VoidCallback? onPressed;

  /// Ícone antes do texto.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: _ButtonContent(label: label, icon: icon),
    );
  }
}

/// Botão escuro de ação secundária ("Novo", "Preparar Linha").
class DarkButton extends StatelessWidget {
  /// Cria o botão.
  const DarkButton({
    required this.label,
    required this.onPressed,
    this.icon,
    super.key,
  });

  /// Texto do botão.
  final String label;

  /// Ação; `null` desabilita o botão.
  final VoidCallback? onPressed;

  /// Ícone antes do texto.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: colors.darkSurface,
        foregroundColor: colors.onDarkSurface,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
      ),
      child: _ButtonContent(label: label, icon: icon),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({required this.label, this.icon, this.trailingIcon});

  final String label;
  final IconData? icon;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 16),
          const SizedBox(width: AppSpacing.xs),
        ],
        Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
        if (trailingIcon != null) ...[
          const SizedBox(width: AppSpacing.xs),
          Icon(trailingIcon, size: 16),
        ],
      ],
    );
  }
}
