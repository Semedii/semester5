import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:term_roject/nav2.dart';
import 'package:term_roject/navNU.dart';

class Wrapper extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    final String? uid = user?.uid;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (_, snapshot) {
    if (snapshot.hasData) {
      var output = snapshot.data!.data();
      bool value = output!['admin'];
      if (value) {
        return NavAdmin(); //go to the screen if he is admin
      } else {
        return NavNU(); //go to this screen if not admin
      }
    }
    else {
      return const CircularProgressIndicator();
    }
      },
    );
  }
}
