// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// Generator: FirestoreConverterGen
// **************************************************************************

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND

Post _from(
  DocumentSnapshot<Map<String, dynamic>> snapshot,
  SnapshotOptions? _,
) =>
    Post.fromJson(snapshot.data()!);

Map<String, dynamic> _to(
  Post data,
  SetOptions? options,
) =>
    data.toJson();

extension on DocumentReference {
  DocumentReference<Post> withPostConverter() {
    return withConverter<Post>(
      fromFirestore: _from,
      toFirestore: _to,
    );
  }
}

CollectionReference<Post> postCollectionRef({required String? parentId}) {
  return userCollectionRef
      .doc(parentId)
      .collection('posts')
      .withConverter<Post>(
        fromFirestore: _from,
        toFirestore: _to,
      );
}

Query<Post> get postCollectionGroup =>
    FirebaseFirestore.instance.collectionGroup('posts').withConverter<Post>(
          fromFirestore: _from,
          toFirestore: _to,
        );

class PostRefConverter
    implements JsonConverter<DocumentReference<Post>, Object> {
  const PostRefConverter();

  @override
  DocumentReference<Post> fromJson(Object json) {
    return (json as DocumentReference<Map<String, dynamic>>)
        .withPostConverter();
  }

  @override
  Object toJson(DocumentReference<Post> object) =>
      FirebaseFirestore.instance.doc(object.path);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      name: json['name'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'name': instance.name,
    };
