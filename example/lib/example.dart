import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_converter_annotation/firestore_converter_annotation.dart';

part 'example.g.dart';

@FirestoreConverter()
class Person {
  Person({
    required this.firstName,
    required this.lastName,
    this.dateOfBirth,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        dateOfBirth: json['dateOfBirth'] == null
            ? null
            : DateTime.parse(json['dateOfBirth'] as String),
      );

  final String firstName;
  final String lastName;
  final DateTime? dateOfBirth;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
      };
}
