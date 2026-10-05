import 'package:fera_metalurgica_app/features/cronograma/cronograma.dart';
import 'package:mocktail/mocktail.dart';

/// Mock de [CronogramaRepository] para testes que dependem da feature
/// `cronograma` sem tocar o armazenamento local real.
class MockCronogramaRepository extends Mock implements CronogramaRepository {}
