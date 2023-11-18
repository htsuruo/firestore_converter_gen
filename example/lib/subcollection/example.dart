// ignore_for_file: unused_local_variable

import 'package:example/subcollection/post.dart';
import 'package:example/subcollection/user.dart';

void main() {
  final collectionRef = userCollectionRef;
  final documentRef = userCollectionRef.doc('uid');
  final subcollectionRef = postCollectionRef(parentId: 'uid');
  final subcollectionDocumentRef =
      postCollectionRef(parentId: 'uid').doc('postId');
}
