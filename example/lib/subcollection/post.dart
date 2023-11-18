import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_converter_annotation/firestore_converter_annotation.dart';

import 'user.dart';

part 'post.g.dart';

@JsonSerializable()
@FirestoreConverter('posts', parent: User)
class Post {
  Post({required this.name});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  final String name;

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
