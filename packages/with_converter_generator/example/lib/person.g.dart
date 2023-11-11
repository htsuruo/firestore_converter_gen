// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// WithConverterGenerator
// **************************************************************************

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
