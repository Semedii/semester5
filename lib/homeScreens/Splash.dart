import 'dart:async';
import 'package:flutter/material.dart';
import '../nav.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
//This splash Screen is the welcome screen. It will only last 2 seconds
class _SplashScreenState extends State<SplashScreen> {
  @override
  //this function is gonna count the time. the 2seconds
  void initState() {
    super.initState();
    new Timer(const Duration(seconds: 2), onclose);
    //Timer(Duration(seconds: 3), onclose());
  }
  //this function will destroy the splash screen when the time is up. and it will direct you to the homepage
  void onclose(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Nav()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            
           child: Image.asset("images/wal.jpg", fit: BoxFit.cover,),
          ),

      ],)
    );
  }
}