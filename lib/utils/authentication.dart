import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication {
  static final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
  static User? currentFirebaseUser;

  static Future<dynamic> signUp(
      {required String email, required String pass}) async {
    try {
      await _firebaseauth.createUserWithEmailAndPassword(
          email: email, password: pass);
      print('auth登録完了');
      return true;
    } on FirebaseAuthException catch (e) {
      print('auth登録エラー');
      return ('登録エラーが発生しました。');
    }
  }
}
