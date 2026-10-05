import 'package:fera_metalurgica_app/core/router/app_router.dart';
import 'package:fera_metalurgica_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: FeraApp()));
}

/// Widget raiz do app FERA.
class FeraApp extends StatelessWidget {
  /// Cria o widget raiz do app.
  const FeraApp({this.themeMode = ThemeMode.system, super.key});

  /// Tema claro/escuro; por padrão segue o sistema.
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FERA',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      routerConfig: appRouter,
    );
  }
}
