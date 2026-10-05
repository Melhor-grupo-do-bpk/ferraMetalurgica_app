import 'package:fera_metalurgica_app/core/theme/app_theme.dart';
import 'package:fera_metalurgica_app/core/widgets/app_top_bar.dart';
import 'package:fera_metalurgica_app/core/widgets/placeholder_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('mostra top bar e o título da aba', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const PlaceholderPage(titulo: 'Catálogo'),
      ),
    );

    expect(find.byType(AppTopBar), findsOneWidget);
    expect(find.text('Catálogo'), findsOneWidget);
  });
}
