import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

Future<void> registerAccount(
  BuildContext context,
  String createEmail,
  String createPassword,
  String createUsername,
) async {
  try {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection('Users')
        .where('Username', isEqualTo: createUsername)
        .get();

    if (query.docs.isNotEmpty) {
      Fluttertoast.showToast(
        msg: 'Username already used',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );

      return;
    }

    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: createEmail, password: createPassword);

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(userCredential.user!.uid)
        .set({'Username':createUsername, 'Email': createEmail});

    Fluttertoast.showToast(
      msg: 'Registered Successfully',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.lightGreenAccent,
      textColor: Colors.white,
    );

    if (context.mounted) {
      context.go('/login');
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      Fluttertoast.showToast(
        msg: 'Email is already in use.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Registration Failed',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
      );
    }
  }
}
