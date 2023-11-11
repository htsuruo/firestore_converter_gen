import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:with_converter_annotation/with_converter_annotation.dart';

part 'main.g.dart';

@withConverter
class User {
  User(this.name, this.age);
  final String name;
  final int age;
}
