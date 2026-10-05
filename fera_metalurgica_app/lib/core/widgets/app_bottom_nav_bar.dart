import 'package:fera_metalurgica_app/core/theme/app_colors.dart';
import 'package:fera_metalurgica_app/core/theme/app_spacing.dart';
import 'package:fera_metalurgica_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Uma aba da [AppBottomNavBar].
typedef AppNavItem = ({IconData icone, String label});

/// Navegação inferior do app: aba ativa em "pill" laranja.
class AppBottomNavBar extends StatelessWidget {
  /// Cria a navegação com [itens], destacando [indiceAtual].
  const AppBottomNavBar({
    required this.itens,
    required this.indiceAtual,
    required this.onSelecionado,
    super.key,
  });

  /// Abas, na ordem de exibição.
  final List<AppNavItem> itens;

  /// Índice da aba ativa.
  final int indiceAtual;

  /// Chamado com o índice da aba tocada.
  final ValueChanged<int> onSelecionado;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.background,
        border: Border(top: BorderSide(color: colors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var i = 0; i < itens.length; i++)
                _NavButton(
                  item: itens[i],
                  ativo: i == indiceAtual,
                  colors: colors,
                  onTap: () => onSelecionado(i),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.item,
    required this.ativo,
    required this.colors,
    required this.onTap,
  });

  final AppNavItem item;
  final bool ativo;
  final AppColors colors;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foreground = ativo ? colors.onPrimary : colors.navInactive;
    final radius = BorderRadius.circular(AppSpacing.radiusMd);
    return Semantics(
      selected: ativo,
      button: true,
      child: Material(
        color: ativo ? colors.navActive : Colors.transparent,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(item.icone, size: 20, color: foreground),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  item.label,
                  style: AppTextStyles.label.copyWith(color: foreground),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
