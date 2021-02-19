import 'package:cloud_firestore/cloud_firestore.dart';

class Medi {
  String id;
  String content;
  String box;
  String date;
  String dose;
  bool done;

  Medi({
    this.id,
    this.content,
    this.box,
    this.done,
    this.dose,
    this.date,
  });

  Medi.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    content = documentSnapshot.data()["content"] as String;
    box = documentSnapshot.data()["box"] as String;
    date = documentSnapshot.data()["date"] as String;
    dose = documentSnapshot.data()["dose"] as String;
    done = documentSnapshot.data()["done"] as bool;
  }
}
