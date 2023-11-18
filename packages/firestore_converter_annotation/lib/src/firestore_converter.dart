class FirestoreConverter {
  const FirestoreConverter(this.name, {this.parent});

  /// Collection name in Firestore
  final String name;

  /// Parent type if this is a subcollection
  final Object? parent;
}
