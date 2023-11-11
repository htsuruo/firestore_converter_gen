import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:with_converter_generator/src/with_converter_generator.dart';

/// Builds generators for `build_runner` to run
Builder withConverterBuilder(BuilderOptions options) {
  return SharedPartBuilder(
    [WithConverterGenerator()],
    'conv',
  );
}
