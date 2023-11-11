import 'package:with_converter_annotation/with_converter_annotation.dart';

@withConverter
class User {
  User(this.name, this.age);
  final String name;
  final int age;
}
