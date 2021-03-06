import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({ required this.uid });

  Future<void> addUser(String firstName,String secondName) async {
    FirebaseFirestore.instance.collection('users').doc(uid)
          .set({
        'uid' : uid,
        'firstname': firstName,
        'secondName': secondName,
        'admin' : false,
        "favorites": <String>[],
      }) ;
    }



}