import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:term_roject/Login%20Screens/screens/loginScreen.dart';
import 'package:term_roject/Login%20Screens/screens/signUpScreen.dart';
import 'package:term_roject/nav.dart';


class DrawerScreenL extends StatelessWidget {
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
          String firstName = output!['firstname'];
          String secondName = output['secondName'];
          return Theme(
            data: Theme.of(context).copyWith(
              canvasColor: const Color(0xff5a5a5a),
              //other styles
            ),
            child: Drawer(
              child: SafeArea(
                child: Column(children: [

                  Row(
                    children: [

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                              height: 200,
                              decoration: const BoxDecoration(
                                color: Color(0xff12c387),
                              ),
                              child:  Padding(
                                padding: EdgeInsets.fromLTRB(50, 70, 50, 50),
                                child: Center(child: Text("$firstName $secondName", style: TextStyle(fontSize: 30, color: Colors.black))),
                              )),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      auth.signOut();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Nav(),
                      ));
                    },
                    child: const Card(
                      child: ListTile(
                        tileColor: Color(0xff12c387),
                        leading:Icon(Icons.logout),
                        title: Text("Sign Out"),
                      ),

                    ),
                  ),
                ]),
              ),
            ),
          );
        }
        else {
          return const CircularProgressIndicator();
        }
      },
    );





  }
}