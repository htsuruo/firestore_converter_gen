/// Provides annotation classes to use with
/// [firestore_converter_gen](https://pub.dev/packages/json_serializable).
library firestore_converter_annotation;

// TODO(htsuruo): 本来は利用元でimportせずに済むようにexportしておきたいが
// build_runner実行時エラーが出るためコメントアウトしている。
// export 'package:cloud_firestore/cloud_firestore.dart';
// export 'src/document_reference_converter_base.dart';

export 'src/firestore_converter.dart';
