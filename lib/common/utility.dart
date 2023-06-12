import 'package:cloud_firestore/cloud_firestore.dart';

class Utility {
  static String generateId() {
    return FirebaseFirestore.instance.collection("asdf").doc().id;
  }
}
