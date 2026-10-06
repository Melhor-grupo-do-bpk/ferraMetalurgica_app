import 'package:fera_metalurgica_app/core/utils/local_json_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_storage_provider.g.dart';

/// Shared instance of `LocalJsonStorage` used by every feature repository.
@riverpod
LocalJsonStorage localJsonStorage(Ref ref) => const LocalJsonStorage();
