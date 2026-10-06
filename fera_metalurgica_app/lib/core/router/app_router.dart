import 'package:fera_metalurgica_app/core/widgets/app_bottom_nav_bar.dart';
import 'package:fera_metalurgica_app/core/widgets/placeholder_page.dart';
import 'package:fera_metalurgica_app/features/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Rotas nomeadas do app. Toda tela nova adiciona sua rota aqui — nunca use
/// `Navigator.push` direto nas features.
abstract final class AppRoutes {
  /// Aba "Início" (dashboard).
  static const String dashboard = '/';

  /// Aba "Orçamentos".
  static const String orcamentos = '/orcamentos';

  /// Aba "Catálogo".
  static const String catalogo = '/catalogo';

  /// Aba "Mais".
  static const String mais = '/mais';
}

/// Abas da navegação inferior, na mesma ordem dos branches do shell.
const List<AppNavItem> _abas = [
  (icone: Icons.home_outlined, label: 'Início'),
  (icone: Icons.request_quote_outlined, label: 'Orçamentos'),
  (icone: Icons.shopping_cart_outlined, label: 'Catálogo'),
  (icone: Icons.menu, label: 'Mais'),
];

/// Instância única de roteamento do app, usada por `MaterialApp.router`.
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.dashboard,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.dashboard,
              builder: (context, state) => const DashboardPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.orcamentos,
              builder: (context, state) =>
                  const PlaceholderPage(titulo: 'Orçamentos'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.catalogo,
              builder: (context, state) =>
                  const PlaceholderPage(titulo: 'Catálogo'),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.mais,
              builder: (context, state) =>
                  const PlaceholderPage(titulo: 'Mais'),
            ),
          ],
        ),
      ],
    ),
  ],
);

/// Estrutura comum às abas: conteúdo da aba ativa + navegação inferior.
class AppShell extends StatelessWidget {
  /// Cria o shell em volta de [navigationShell].
  const AppShell({required this.navigationShell, super.key});

  /// Shell do go_router que mantém o estado de cada aba.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppBottomNavBar(
        itens: _abas,
        indiceAtual: navigationShell.currentIndex,
        onSelecionado: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }
}
