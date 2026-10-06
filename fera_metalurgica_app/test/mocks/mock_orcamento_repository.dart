import 'package:fera_metalurgica_app/features/orcamentos/orcamentos.dart';
import 'package:mocktail/mocktail.dart';

/// Mock de [OrcamentoRepository] para uso em testes de unidade/widget que
/// dependem da feature `orcamentos` sem tocar o armazenamento local real.
class MockOrcamentoRepository extends Mock implements OrcamentoRepository {}
