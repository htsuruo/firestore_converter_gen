// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// Generator: FirestoreConverterGen
// **************************************************************************

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

User _from(
  DocumentSnapshot<Map<String, dynamic>> snapshot,
  SnapshotOptions? _,
) =>
    User.fromJson(snapshot.data()!);

Map<String, dynamic> _to(
  User data,
  SetOptions? options,
) =>
    data.toJson();

extension on DocumentReference {
  DocumentReference<User> withUserConverter() {
    return withConverter<User>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

CollectionReference<User> get userCollectionRef =>
    FirebaseFirestore.instance.collection('users').withConverter<User>(
          fromFirestore: _from,
          toFirestore: _to,
        );

Query<User> get userCollectionGroup =>
    FirebaseFirestore.instance.collectionGroup('users').withConverter<User>(
          fromFirestore: _from,
          toFirestore: _to,
        );

class UserRefConverter
    implements JsonConverter<DocumentReference<User>, Object> {
  const UserRefConverter();

  @override
  DocumentReference<User> fromJson(Object json) {
    return (json as DocumentReference<Map<String, dynamic>>)
        .withUserConverter();
  }

  @override
  Object toJson(DocumentReference<User> object) =>
      FirebaseFirestore.instance.doc(object.path);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
    };
