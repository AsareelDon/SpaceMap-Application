import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Authentication {
  static final _auth = FirebaseAuth.instance;
  static final _fireStore = FirebaseFirestore.instance;

  Future<bool> createAccount(
    String email,
    String password,
    String name,
    int age,
    String address,
    String role,
    String? posts,
    String? profileImage,
  ) async {
    try {
      UserCredential auth = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? logInUser = auth.user;
      if (logInUser != null) {
        _fireStore.collection('users').doc(logInUser.uid).set({
          'email': email,
          'name': name,
          'age': age,
          'address': address,
          'role': role,
          'posts': '',
          'profileImage': '',
        });
        return true;
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
