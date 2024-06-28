import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SharedRecord extends FirestoreRecord {
  SharedRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shared');

  static Stream<SharedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SharedRecord.fromSnapshot(s));

  static Future<SharedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SharedRecord.fromSnapshot(s));

  static SharedRecord fromSnapshot(DocumentSnapshot snapshot) => SharedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SharedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SharedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SharedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SharedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSharedRecordData({
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class SharedRecordDocumentEquality implements Equality<SharedRecord> {
  const SharedRecordDocumentEquality();

  @override
  bool equals(SharedRecord? e1, SharedRecord? e2) {
    return e1?.time == e2?.time;
  }

  @override
  int hash(SharedRecord? e) => const ListEquality().hash([e?.time]);

  @override
  bool isValidKey(Object? o) => o is SharedRecord;
}
