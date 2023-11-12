# firestore_converter_gen

This package automatically generates typed converters for [cloud_firestore](https://pub.dev/packages/cloud_firestore).

When you add the `@FirestoreConverter` or `@firestoreConverter` annotation to your defined model, those methods will be automatically generated. This can be also used with [json_serializable](https://pub.dev/packages/json_serializable) and [freezed](https://pub.dev/packages/freezed).

This package consists of the following two packages:
- [firestore_converter_gen](https://github.com/htsuruo/firestore_converter_gen/tree/main/packages/firestore_converter_gen)
  - The logic for automatic generation.
- [firestore_converter_annotation](https://github.com/htsuruo/firestore_converter_gen/tree/main/packages/firestore_converter_annotation)
  - An annotation used to detect the class that will be subject to automatic generation.

## Usage

1. Add packages to the `dependencies` and `dev_dependencies` in `pubspec.yaml`.

```yaml: pubspec.yaml
dependencies:
  firestore_converter_annotation:

dev_dependencies:
  build_runner:
  firestore_converter:
```

2. To use this package, `toJson` and `fromJson` must be predefined, as following example.

```dart:person.dart
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

3. Run `build_runner`

```sh
dart run build_runner build
```

### Use with freezed

```dart:person.dart
@freezed
@firestoreConverter
class Person with _$Person {
  const factory Person({
    required String firstName,
    required String lastName,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
```

```dart
// Return Firestore data typed with `Post` class, and then you can use some properties easily.
final person = FirebaseFirestore.instance.collection('posts').withPostConverter().snapshots();

```

## Features

- Generates `withConverter` typed method for [DocumentReference](https://pub.dev/documentation/cloud_firestore/latest/cloud_firestore/DocumentReference-class.html), [CollectionReference](https://pub.dev/documentation/cloud_firestore/latest/cloud_firestore/CollectionReference-class.html), [Query](https://pub.dev/documentation/cloud_firestore/latest/cloud_firestore/Query-class.html)
