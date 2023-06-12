import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthRepo {
  Future<bool> lookupUsername(String username);
}

class IAuthRepo implements AuthRepo {
  final _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _usernameRef =>
      _firestore.collection("username");
  @override
  Future<bool> lookupUsername(String username) async {
    final docs = (await _usernameRef
            .where("username", isEqualTo: username.toLowerCase())
            .get())
        .docs;
    if (docs.isEmpty) return false;
    String data = docs.first.data()["username"];
    log("Data: $data");
    log("UserName: $username");
    if (data.toLowerCase() == username.toLowerCase()) return true;
    return false;
  }
}
