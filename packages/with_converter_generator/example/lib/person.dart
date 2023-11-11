import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:with_converter_annotation/with_converter_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
@WithConverter()
class Person {
  Person({required this.firstName, required this.lastName, this.dateOfBirth});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  /// The generated code assumes these values exist in JSON.
  final String firstName;
  final String lastName;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final DateTime? dateOfBirth;

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
