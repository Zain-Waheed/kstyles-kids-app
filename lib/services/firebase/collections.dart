import 'package:cloud_firestore/cloud_firestore.dart';

class FBCollections {
  static CollectionReference todos =
      FirebaseFirestore.instance.collection("todos");
}
