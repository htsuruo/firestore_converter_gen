import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/firestore_converter_generator.dart';

/// Builds generators for `build_runner` to run
Builder firestoreConverterBuilder(BuilderOptions options) {
  return SharedPartBuilder(
    [FirestoreConverterGenerator()],
    'firestore_converter',
  );
}
