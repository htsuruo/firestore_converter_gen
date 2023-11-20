// ignore_for_file: implementation_imports

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:firestore_converter_annotation/firestore_converter_annotation.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';

/// A code generator for FirestoreConverter annotations.
///
/// This class is responsible for generating code based on
/// the [FirestoreConverter] annotation.
class FirestoreConverterGen extends GeneratorForAnnotation<FirestoreConverter> {
  @override
  Stream<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async* {
    final name = element.name!;
    final lowerName = name.camelCase;
    final collectionName = annotation.read('name').stringValue;
    final parentType = annotation.peek('parent')?.objectValue;
    final parentName = _getParentNameIfExists(parentType);

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

    ${_generateCollectionReference(
      parentName: parentName,
      name: name,
      lowerName: lowerName,
      collectionName: collectionName,
    )}

    Query<$name> get ${lowerName}CollectionGroup =>
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

/// Generates a collection reference.
///
/// This function returns a [String] representing the generated collection
/// reference.
String _generateCollectionReference({
  required String? parentName,
  required String name,
  required String lowerName,
  required String collectionName,
}) {
  if (parentName != null) {
    return '''
    CollectionReference<$name> ${lowerName}CollectionRef({required String? parentId}) {
        return ${parentName}CollectionRef.doc(parentId).collection('$collectionName').withConverter<$name>(
              fromFirestore: _from,
              toFirestore: _to,
            );
        }
    ''';
  }
  return '''
    CollectionReference<$name> get ${lowerName}CollectionRef =>
        FirebaseFirestore.instance.collection('$collectionName').withConverter<$name>(
              fromFirestore: _from,
              toFirestore: _to,
            );
  ''';
}

/// Retrieve the parent name from the parent type
/// ex) User class: Type(User*) → User* → user
String? _getParentNameIfExists(DartObject? parentType) =>
    parentType?.toTypeValue()?.toString().replaceAll('*', '').trim().camelCase;
