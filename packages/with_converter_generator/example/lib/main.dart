import 'package:with_converter_annotation/with_converter_annotation.dart';

@withConverter
class User {
  final String name;
  final int age;

  User(this.name, this.age);
}
