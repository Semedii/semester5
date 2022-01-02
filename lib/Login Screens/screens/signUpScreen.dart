import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:term_roject/Authentication/auth.dart';
import 'package:term_roject/Login%20Screens/widgets/inputTextWidget.dart';
import 'package:term_roject/Services/database.dart';

import '../../nav.dart';
import 'loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen() : super();

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _secondName = TextEditingController();
  String error = '';
  String goodNews = '';

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff12c387),
      appBar: AppBar(
        title: const Text("Sign Up",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Segoe UI',
              fontSize: 30,
            )),
        //centerTitle: true,
        leading: InkWell(
          onTap: () {Navigator.pop(context);},
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: const Color (0xFF5a5a5a),
            
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: screenWidth,
          height: screenHeight,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    'Create a new account',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                   InputTextWidget(
                      labelText: "Name",
                      controller: _firstName,
                      icon: Icons.person,
                      obscureText: false,
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 12.0,
                  ),
                   InputTextWidget(
                      controller: _secondName,
                      labelText: "Surname",
                      icon: Icons.person,
                      obscureText: false,
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 12.0,
                  ),
                  InputTextWidget(
                      controller: _emailController,
                      labelText: "Email",
                      icon: Icons.email,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 12.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Material(
                      elevation: 15.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.circular(15.0),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 20.0, left: 15.0),
                        child: TextFormField(
                            obscureText: true,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.black,
                                size: 32.0, /*Color(0xff224597)*/
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: Colors.black54, fontSize: 18.0),
                              hintText: '',
                              enabledBorder: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                              ),
                              border: InputBorder.none,
                            ),
                            controller: _pass,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please write a password';
                              } else if (val.length < 6) {
                                return 'password must be more than 5 characters';
                              }

                              return null;
                            }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Material(
                      elevation: 15.0,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.circular(15.0),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 20.0, left: 15.0),
                        child: TextFormField(
                            obscureText: true,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.black,
                                size: 32.0, /*Color(0xff224597)*/
                              ),
                              labelText: "Repeat Password",
                              labelStyle: TextStyle(
                                  color: Colors.black54, fontSize: 18.0),
                              enabledBorder: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                              ),
                              border: InputBorder.none,
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please repeat the Password';
                              }
                              if (val != _pass.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 55.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (_formKey.currentState!.validate()) {
                          try {
                            AuthService().registerWithEmailAndPassword(_emailController.text, _pass.text, _firstName.text, _secondName.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>LoginScreen() ),
                            );
                          } catch (e){
                            setState(() {
                              error='Cannot Sign up with these Credentials';
                            });

                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary:  const Color(0xff12c387),
                        elevation: 0.0,
                        minimumSize: Size(screenWidth, 150),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color:  Color(0xff12c387),
                                  offset: Offset(1.1, 1.1),
                                  blurRadius: 2.0),
                            ],
                            color: const Color(0xff12c387),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Create Account",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      goodNews,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
