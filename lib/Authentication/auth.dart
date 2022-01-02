import 'package:firebase_auth/firebase_auth.dart';
import 'package:term_roject/Services/database.dart';
import 'package:term_roject/Services/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  UserNor? _userFromFirebaseUser(String? user) {
    return user != null ? UserNor(uid: user) : null;
  }


  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      String? user = result.user?.uid;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password,String firstName,String secondName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      String? user = result.user?.uid;
      // create a new document for the user with the uid
      await DatabaseService(uid: user).addUser(firstName,secondName);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}