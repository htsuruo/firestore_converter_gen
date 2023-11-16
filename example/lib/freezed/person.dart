import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_converter_annotation/firestore_converter_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
@FirestoreConverter('persons')
class Person with _$Person {
  const factory Person({
    required String firstName,
    required String lastName,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
