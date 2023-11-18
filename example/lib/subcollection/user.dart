import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_converter_annotation/firestore_converter_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@FirestoreConverter('users')
class User {
  User({required this.name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final String name;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
