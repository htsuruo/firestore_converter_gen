import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class DocumentReferenceConverterBase<E>
    implements JsonConverter<DocumentReference<E>, Object> {
  const DocumentReferenceConverterBase();

  @override
  DocumentReference<E> fromJson(Object json) {
    return convert(json as DocumentReference<Map<String, dynamic>>);
  }

  DocumentReference<E> convert(DocumentReference<Map<String, dynamic>> ref);

  @override
  Object toJson(DocumentReference<E> object) =>
      FirebaseFirestore.instance.doc(object.path);
}
