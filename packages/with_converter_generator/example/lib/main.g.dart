// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// WithConverterGenerator
// **************************************************************************

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

User _from(
  DocumentSnapshot<Map<String, dynamic>> snapshot,
  SnapshotOptions? options,
) =>
    User.fromJson(snapshot.data()!);

Map<String, dynamic> _to(
  User data,
  SetOptions? options,
) =>
    data.toJson();

extension DocumentReferenceUserConverter on DocumentReference {
  DocumentReference<User> withUserConverter() {
    return withConverter<User>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

extension CollectionReferenceUserConverter on CollectionReference {
  CollectionReference<User> withUserConverter() {
    return withConverter<User>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

extension QueryUserConverter on Query {
  Query<User> withUserConverter() {
    return withConverter<User>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}
