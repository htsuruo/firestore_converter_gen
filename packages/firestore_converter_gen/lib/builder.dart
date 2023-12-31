import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/firestore_converter_gen.dart';

/// Builds generators for `build_runner` to run
Builder firestoreConverterBuilder(BuilderOptions options) {
  return SharedPartBuilder(
    [FirestoreConverterGen()],
    'firestore_converter',
  );
}
