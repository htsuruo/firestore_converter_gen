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

extension DocumentReferencePersonConverter on DocumentReference {
  DocumentReference<Person> withPersonConverter() {
    return withConverter<Person>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

extension CollectionReferencePersonConverter on CollectionReference {
  CollectionReference<Person> withPersonConverter() {
    return withConverter<Person>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

extension QueryPersonConverter on Query {
  Query<Person> withPersonConverter() {
    return withConverter<Person>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

// class PersonRefConverter extends DocumentReferenceConverterBase<Person> {
//   const PersonRefConverter();
//
//   @override
//   DocumentReference<Person> convert(
//     DocumentReference<Map<String, dynamic>> ref,
//   ) =>
//       ref.withPersonConverter();
// }

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
