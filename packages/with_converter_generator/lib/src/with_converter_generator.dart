// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:with_converter_annotation/with_converter_annotation.dart';

class WithConverterGenerator extends GeneratorForAnnotation<WithConverter> {
  @override
  Stream<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async* {
    final name = element.name;
    final functionName = 'with${name}Converter';

    yield '''
    // coverage:ignore-file
    // GENERATED CODE - DO NOT MODIFY BY HAND
    // ignore_for_file: type=lint
    // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

    $name _from(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? _,
    ) =>
        $name.fromJson(snapshot.data()!);

    Map<String, dynamic> _to(
      $name data,
      SetOptions? options,
    ) =>
        data.toJson();

    extension DocumentReference${name}Converter on DocumentReference {
      DocumentReference<$name> $functionName() {
        return withConverter<$name>(
          fromFirestore: _from,
          toFirestore: _to,
        );
      }
    }

    extension CollectionReference${name}Converter on CollectionReference {
      CollectionReference<$name> $functionName() {
        return withConverter<$name>(
          fromFirestore: _from,
          toFirestore: _to,
        );
      }
    }

    extension Query${name}Converter on Query {
      Query<$name> $functionName() {
        return withConverter<$name>(
          fromFirestore: _from,
          toFirestore: _to,
        );
      }
    }
    ''';
  }
}
