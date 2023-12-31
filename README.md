### Since [cloud_firestore_odm](https://pub.dev/packages/cloud_firestore_odm) meets the requirements of this repository, it seems that this is not necessary

---

# firestore_converter_gen

This package automatically generates type-safe converters for [cloud_firestore](https://pub.dev/packages/cloud_firestore).

When you add the `@FirestoreConverter()` annotation to your defined model class, type-safe converter methods will be automatically generated. This can be also used with [json_serializable](https://pub.dev/packages/json_serializable) and [freezed](https://pub.dev/packages/freezed).

This generator consists of the following two packages:
- [firestore_converter_gen](https://github.com/htsuruo/firestore_converter_gen/tree/main/packages/firestore_converter_gen)
  - The logic for automatic generation.
- [firestore_converter_annotation](https://github.com/htsuruo/firestore_converter_gen/tree/main/packages/firestore_converter_annotation)
  - An annotation used to detect the class that will be subject to automatic generation.

## Usage

#### 1. Add packages to the `dependencies` and `dev_dependencies` in `pubspec.yaml`

```yaml:pubspec.yaml
dependencies:
  # cloud_firestore:
  firestore_converter_annotation:

dev_dependencies:
  # build_runner:
  firestore_converter:
```

#### 2. Set `@FirestoreConverter()` annotation to the class for generation

- Declare `[filename].g.dart`.
- To use this package, `toJson` and `fromJson` must be predefined, as following example.

```dart:person.dart
part 'person.g.dart';

// Set annotation here.
@FirestoreConverter()
class Person {
  Person({required this.firstName});

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        firstName: json['firstName'] as String,
      );

  final String firstName;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'firstName': firstName,
      };
}
```

#### 3. Run `build_runner`

```sh
dart run build_runner build
```

### Use with freezed

```dart:person.dart
@freezed
@FirestoreConverter()
class Person with _$Person {
  const factory Person({
    required String firstName,
    required String lastName,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
```

## Features

### withConverter

Generates `withConverter` type-safe method for [DocumentReference](https://pub.dev/documentation/cloud_firestore/latest/cloud_firestore/DocumentReference-class.html), [CollectionReference](https://pub.dev/documentation/cloud_firestore/latest/cloud_firestore/CollectionReference-class.html), [Query](https://pub.dev/documentation/cloud_firestore/latest/cloud_firestore/Query-class.html)

For example, in the case of a `Post` class, `withPostConverter` is generated, allowing you to write simply as shown below.

```dart
final person = FirebaseFirestore.instance.collection('posts').withPostConverter().snapshots();
```
