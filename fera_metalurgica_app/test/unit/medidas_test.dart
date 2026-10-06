import 'package:fera_metalurgica_app/features/orcamentos/orcamentos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Medidas.formatada', () {
    test('com as três medidas usa a ordem A x L x C', () {
      const medidas = Medidas(altura: 2.5, largura: 2.2, comprimento: 0.05);

      expect(medidas.formatada, '2.50m x 2.20m x 0.05m');
    });

    test('com só duas medidas omite a ausente e mantém a ordem', () {
      expect(
        const Medidas(altura: 2.5, largura: 2.2).formatada,
        '2.50m x 2.20m',
      );
      expect(
        const Medidas(altura: 3, comprimento: 12).formatada,
        '3.00m x 12.00m',
      );
      expect(
        const Medidas(largura: 1.2, comprimento: 6).formatada,
        '1.20m x 6.00m',
      );
    });

    test('com uma medida devolve só ela', () {
      expect(const Medidas(largura: 4).formatada, '4.00m');
    });

    test('sem nenhuma medida devolve string vazia', () {
      expect(const Medidas().formatada, isEmpty);
    });
  });
}
