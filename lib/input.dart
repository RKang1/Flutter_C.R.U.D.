import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Input {
  final String text;
  final DocumentReference reference;

  Input.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['Text'] != null),
        text = map['Text'];

  Input.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() {
    return this.text;
  }
}
