// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// Generator: FirestoreConverterGen
// **************************************************************************

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

Person _from(
  DocumentSnapshot<Map<String, dynamic>> snapshot,
  SnapshotOptions? _,
) =>
    Person.fromJson(snapshot.data()!);

Map<String, dynamic> _to(
  Person data,
  SetOptions? options,
) =>
    data.toJson();

extension on DocumentReference {
  DocumentReference<Person> withPersonConverter() {
    return withConverter<Person>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

CollectionReference<Person> personCollectionRef() =>
    FirebaseFirestore.instance.collection('persons').withConverter<Person>(
          fromFirestore: _from,
          toFirestore: _to,
        );

DocumentReference<Person> personDocumentRef({
  DocumentReference? ref,
  String? documentId,
}) =>
    ref == null
        ? personCollectionRef().doc(documentId).withPersonConverter()
        : ref.withPersonConverter();

Query<Person> personCollectionGroup() =>
    FirebaseFirestore.instance.collectionGroup('persons').withConverter<Person>(
          fromFirestore: _from,
          toFirestore: _to,
        );

class PersonRefConverter
    implements JsonConverter<DocumentReference<Person>, Object> {
  const PersonRefConverter();

  @override
  DocumentReference<Person> fromJson(Object json) {
    return (json as DocumentReference<Map<String, dynamic>>)
        .withPersonConverter();
  }

  @override
  Object toJson(DocumentReference<Person> object) =>
      FirebaseFirestore.instance.doc(object.path);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
    };
