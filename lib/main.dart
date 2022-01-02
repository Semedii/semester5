import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'homeScreens/Splash.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OTF Score',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: const SplashScreen(), //MyHomePage(title: 'OTF Score'),
    );
  }
}