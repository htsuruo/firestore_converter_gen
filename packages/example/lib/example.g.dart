// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

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

// typed with converter extension methods for DocumentReference
extension DocumentReferencePersonConverter on DocumentReference {
  DocumentReference<Person> withPersonConverter() {
    return withConverter<Person>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

// typed with converter extension methods for CollectionReference
extension CollectionReferencePersonConverter on CollectionReference {
  CollectionReference<Person> withPersonConverter() {
    return withConverter<Person>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

// typed with converter extension methods for Query(CollectionGroup)
extension QueryPersonConverter on Query {
  Query<Person> withPersonConverter() {
    return withConverter<Person>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

// You can convert DocumentReference with `Person` typed directly.
// class PersonRefConverter extends DocumentReferenceConverterBase<Person> {
//   const PersonRefConverter();
//
//   @override
//   DocumentReference<Person> convert(
//     DocumentReference<Map<String, dynamic>> ref,
//   ) =>
//       ref.withPersonConverter();
// }
