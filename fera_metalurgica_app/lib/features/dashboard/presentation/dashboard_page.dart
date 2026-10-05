import 'package:fera_metalurgica_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

/// Tela inicial do app: indicadores de orçamentos e lista de recentes.
///
/// Placeholder mínimo — os indicadores ainda não são calculados a partir do
/// repositório de orçamentos; isso entra quando a feature `orcamentos`
/// ganhar sua camada de apresentação.
class DashboardPage extends StatelessWidget {
  /// Cria a tela inicial do dashboard.
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.appName)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Orçamentos', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            const Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _IndicadorCard(label: 'Em andamento', valor: 0),
                _IndicadorCard(label: 'Aguardando resposta', valor: 0),
                _IndicadorCard(label: 'Aprovados', valor: 0),
                _IndicadorCard(label: 'Pendentes', valor: 0),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Orçamentos recentes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            const Expanded(
              child: Center(child: Text('Nenhum orçamento ainda.')),
            ),
          ],
        ),
      ),
    );
  }
}

class _IndicadorCard extends StatelessWidget {
  const _IndicadorCard({required this.label, required this.valor});

  final String label;
  final int valor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$valor', style: Theme.of(context).textTheme.headlineMedium),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
