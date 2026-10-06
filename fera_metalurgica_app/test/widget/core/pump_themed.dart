import 'package:fera_metalurgica_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Monta [child] dentro de um `MaterialApp` com o tema do app.
Future<void> pumpThemed(
  WidgetTester tester,
  Widget child, {
  ThemeMode themeMode = ThemeMode.light,
}) {
  return tester.pumpWidget(
    MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      home: Scaffold(
        body: Padding(padding: const EdgeInsets.all(16), child: child),
      ),
    ),
  );
}
