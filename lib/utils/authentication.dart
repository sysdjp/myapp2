import 'dart:math';

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
      print('auth登録エラー: $e');
      return false;
    }
  }

  static Future<dynamic> emailSignIn(
      {required String email, required String pass}) async {
    try {
      final UserCredential _result = await _firebaseauth
          .signInWithEmailAndPassword(email: email, password: pass);
      print('サインイン完了');
      return true;
    } on FirebaseAuthException catch (e) {
      print('サインインエラー: $e');
      return false;
    }
  }
}
