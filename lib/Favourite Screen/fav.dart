import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class fav extends StatelessWidget {
  const fav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5a5a5a),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF12c387),
        title: const Text(
          'Favourites',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'Edit',
                style: TextStyle(fontSize: 25.0,
                color: Colors.black),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.add_circle_outline_rounded,
            color: Colors.black,),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Row(
                           children: [
                             Image.asset(
                               'images/city.png',
                               height: 50.0,
                               width: 50.0,
                               fit: BoxFit.contain,
                              alignment: Alignment.topLeft,
                             ),
                           ],
                         ),
                         SizedBox(
                           height: 12.0,
                         ),
                         Row(
                           children: [
                             Text('Man City', style: TextStyle(fontSize: 20.0, color: Colors.white),),
                           ],
                         ),
                         SizedBox(
                           height: 15.0,
                         ),
                         Row(
                           children: [
                             Icon(FontAwesomeIcons.planeDeparture),
                             SizedBox(
                               width: 10.0,
                             ),
                             Text('Everton', style: TextStyle(fontSize: 15.0),),
                           ],
                         ),
                         Row(
                           children: [
                             Text('Sun,21 Nov, 5:00pm'),
                           ],
                         ),
                       ],
                     ),
                   ),

                  ),
                ),
                Expanded(
                  child: Reusable(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable(),
                ),
                Expanded(
                  child: Reusable(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable(),
                ),
                Expanded(
                  child: Reusable(),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

class Reusable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
