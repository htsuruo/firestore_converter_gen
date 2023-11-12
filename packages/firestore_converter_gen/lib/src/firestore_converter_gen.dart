// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:firestore_converter_annotation/firestore_converter_annotation.dart';
import 'package:source_gen/source_gen.dart';

class FirestoreConverterGen extends GeneratorForAnnotation<FirestoreConverter> {
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

    // typed with converter extension methods for DocumentReference
    extension DocumentReference${name}Converter on DocumentReference {
      DocumentReference<$name> $functionName() {
        return withConverter<$name>(
          fromFirestore: _from,
          toFirestore: _to,
        );
      }
    }

    // typed with converter extension methods for CollectionReference
    extension CollectionReference${name}Converter on CollectionReference {
      CollectionReference<$name> $functionName() {
        return withConverter<$name>(
          fromFirestore: _from,
          toFirestore: _to,
        );
      }
    }

    // typed with converter extension methods for Query(CollectionGroup)
    extension Query${name}Converter on Query {
      Query<$name> $functionName() {
        return withConverter<$name>(
          fromFirestore: _from,
          toFirestore: _to,
        );
      }
    }

    // You can convert DocumentReference with `$name` typed directly.
    class ${name}RefConverter extends DocumentReferenceConverterBase<$name> {
      const ${name}RefConverter();

      @override
      DocumentReference<$name> convert(
        DocumentReference<Map<String, dynamic>> ref,
      ) =>
          ref.with${name}Converter();
    }
    ''';
  }
}
