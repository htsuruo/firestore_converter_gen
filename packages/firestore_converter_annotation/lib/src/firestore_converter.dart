/// A class that represents a Firestore converter.
/// This class is used to define for `firestore_converter_gen`.
class FirestoreConverter {
  const FirestoreConverter(this.name, {this.parent});

  /// Collection name in Firestore
  final String name;

  /// Parent type if this is a subcollection
  final Object? parent;
}
