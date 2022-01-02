import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:term_roject/Model/LineUp.dart';

import 'Widgets.dart';
import 'package:http/http.dart' as http;

class MatchDetailScreen extends StatefulWidget {

 String Team1;
 String Team2;
 String ImageUrl;
 String Time;
 DateTime Date;
 String Stadium;
 String Referee;
 String League;
  MatchDetailScreen({
    required this.Team1,
    required this.Team2,
    required this.ImageUrl,
    required this.Date,
    required this.Time,
    required this.Stadium,
    required this.Referee,
    required this.League
  });

 
  

@override
  _MatchDetailScreenState createState() => _MatchDetailScreenState();
}

class _MatchDetailScreenState extends State<MatchDetailScreen> {

  
  
  @override
  Widget build(BuildContext context) {
   
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      backgroundColor: Color(0xFF5a5a5a),
       appBar: AppBar(
         leading: IconButton(
           icon: Icon(Icons.arrow_back, color: Colors.black),
           onPressed: () => Navigator.of(context).pop(),
         ),
         automaticallyImplyLeading: false,
         backgroundColor: Color(0xff12c387),
        title: Text(widget.Team1+" vs "+widget.Team2,
        style: TextStyle(
          color: Colors.black
        ),),
        
      ),
      body: 
      Container(
        
        child: SingleChildScrollView(
          child: Column(
            children: [
            matches(Team1: widget.Team1, Team2: widget.Team2, imageurl: widget.ImageUrl),

            Container(
          
              decoration: BoxDecoration(

              color:   Color(0xff12c387),
                borderRadius: BorderRadius.circular(15)
              ),
             height: 180,
           
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black.withOpacity(0.4))
                       ),
                child:Row(
                  
                  children: [

                    Icon(Icons.calendar_today),
                    Text("${DateFormat.yMMMd().format(widget.Date)} | ${widget.Time}")
                  ],
                ),
                  ),

                 Container(
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black.withOpacity(0.4))
                       ),
                child: Row(
                  children: [
                    Icon(Icons.sports_soccer),
                    Text(widget.League)
                  ],
                ),
                 ),
                 Container(
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black.withOpacity(0.4))
                       ),
                child:  Row(
                  children: [
                    Icon(Icons.place),
                    Text(widget.Stadium)
                  ],
                ),
                 ),

                  Container(
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black.withOpacity(0.4))
                       ),
                child: Row(
                  children: [
                    Icon(Icons.male_outlined),
                    Text(widget.Referee)
                  ],
                ))
              ],),
            ),
         
          
            ]),
      ),
      
    ));
  }
}