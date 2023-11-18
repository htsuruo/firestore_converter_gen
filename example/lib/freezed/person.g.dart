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

CollectionReference<Person> get personCollectionRef =>
    FirebaseFirestore.instance.collection('persons').withConverter<Person>(
          fromFirestore: _from,
          toFirestore: _to,
        );

Query<Person> get personCollectionGroup =>
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

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      age: json['age'] as int,
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
    };
