import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> loginAccount(
  BuildContext context,
  username,
  String password,
) async {
  try {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('Users')
        .where('Username', isEqualTo: username)
        .limit(1)
        .get();

    if (query.docs.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Username not found',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
      return;
    }

    if (context.mounted) {
      context.go('/login');
    }

    var userDoc = query.docs.first;
    String email = userDoc['Email'];
    String userId = userDoc.id;

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user != null && userCredential.user!.uid == userId) {
      if (context.mounted) {
        context.go('/carousel');
      }
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'wrong-password') {
      Fluttertoast.showToast(
        msg: 'Incorrect Password',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Login Failed Wrong Username or Password',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
    }
  }
}
