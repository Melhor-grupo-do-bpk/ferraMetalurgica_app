import 'package:fera_metalurgica_app/features/catalogo/catalogo.dart';
import 'package:mocktail/mocktail.dart';

/// Mock de [CatalogoRepository] para testes que dependem da feature
/// `catalogo` sem tocar o armazenamento local real.
class MockCatalogoRepository extends Mock implements CatalogoRepository {}
