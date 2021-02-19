import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/medi.dart';

class Database {
  final FirebaseFirestore firestore;

  Database({this.firestore});

  /**
   * @param uid of user
   */
  Stream<List<Medi>> streamMeds({String uid}) {
    try {
      return firestore
          .collection("med")
          .doc(uid)
          .collection("med")
          .where("done", isEqualTo: false)
          .snapshots()
          .map((QuerySnapshot querySnapshot) {
        final List<Medi> retVal = <Medi>[];
        querySnapshot.docs.forEach((doc) {
          retVal.add(Medi.fromDocumentSnapshot(documentSnapshot: doc));
        });
        return retVal;
      });
    } catch (e) {
      rethrow;
    }
  }

  /**
   * @param uid of user
   * @param content of Medi
   */
  Future<void> addMed(
      {String uid,
      String content,
      String box,
      String date,
      String dose}) async {
    try {
      firestore.collection("med").doc(uid).collection("med").add({
        "content": content,
        "box": box,
        "dose": dose,
        "date": date,
        "done": false
      });
    } catch (e) {
      rethrow;
    }
  }

  /**
   * @param uid of user
   * @param id of Medi
   */
  Future<void> updateMed({String uid, String id}) async {
    try {
      firestore.collection("med").doc(uid).collection("med").doc(id).update({
        "done": true,
      });
    } catch (e) {
      rethrow;
    }
  }
}
