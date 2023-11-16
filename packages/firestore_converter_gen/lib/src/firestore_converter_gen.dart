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
    final lowerName = element.name?.toLowerCase();
    final collectionName = annotation.read('name').literalValue! as String;

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


    extension on DocumentReference {
      DocumentReference<$name> with${name}Converter() {
        return withConverter<$name>(
          fromFirestore: _from,
          toFirestore: _to,
        );
      }
    }

    CollectionReference<$name> ${lowerName}CollectionRef() =>
        FirebaseFirestore.instance.collection('$collectionName').withConverter<$name>(
              fromFirestore: _from,
              toFirestore: _to,
            );

    DocumentReference<$name> ${lowerName}DocumentRef({
      DocumentReference? ref,
      String? documentId,
    }) =>
        ref == null ? ${lowerName}CollectionRef().doc(documentId).with${name}Converter() : ref.with${name}Converter();

    Query<$name> ${lowerName}CollectionGroup() =>
        FirebaseFirestore.instance.collectionGroup('$collectionName').withConverter<$name>(
              fromFirestore: _from,
              toFirestore: _to,
            );

    class ${name}RefConverter
        implements JsonConverter<DocumentReference<$name>, Object> {
      const ${name}RefConverter();

      @override
      DocumentReference<$name> fromJson(Object json) {
        return (json as DocumentReference<Map<String, dynamic>>).with${name}Converter();
      }

      @override
      Object toJson(DocumentReference<$name> object) =>
          FirebaseFirestore.instance.doc(object.path);
    }
    ''';
  }
}
