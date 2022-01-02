import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:term_roject/Model/Matches.dart';
import 'package:term_roject/homeScreens/newMatch.dart';
import 'MatchDetail.dart';
import 'Widgets.dart';
import 'drawer.dart';
import 'package:http/http.dart' as http;

//this homepage screen has the following
// A stack. and inside the stack are a     listview where you can add the new matches 
// the matches is a class with two parameters (the two teams)
// and also there Row with three different buttons in the stack.
//those three different buttons will navigate to three different screens
//inside the appbar there is settings which will navigate to setting screen and...
//..main menu where you can login or sign up.


class MyHomePage extends StatefulWidget {
 

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   List<Matches> MatchList = [
    // Matches(Team1: "Man United", Team2: "Liverpool",
    //     ImageUrl: "https://i2-prod.manchestereveningnews.co.uk/sport/football/article20512072.ece/ALTERNATES/s1200c/2_munliv.png",
    //     League: "Premiere League", referee: "Anthony", Stadium: "Old Traffod", Time: "18:30", Date: DateTime.now()),
    // Matches(Team1: "Man city", Team2: "Liverpool",
    //     ImageUrl: "https://i2-prod.manchestereveningnews.co.uk/sport/football/article20512072.ece/ALTERNATES/s1200c/2_munliv.png",
    //     League: "Premiere League", referee: "Anthony", Stadium: "Old Traffod", Time: "20:32", Date: DateTime.now()),
    // Matches(Team1: "Real Madrid", Team2: "Barcelona",
    //     ImageUrl: "https://picsum.photos/250?image=9",
    //     League: "Premiere League", referee: "Anthony", Stadium: "Old Traffod", Time: "19:09", Date: DateTime.now())
  ];

  Future<void> fetchmatches() async{
    final url =Uri.parse("https://oftscore-default-rtdb.firebaseio.com/matches.json");
    try{
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
     final List<Matches> LoadedList = [];
    extractedData.forEach((key, value) {
     LoadedList.add(Matches(
       Team1: value["Team1"], 
       Team2: value["Team2"], 
       ImageUrl: value["ImageUrl"], 
       League: value["League"], 
       referee: value["referee"], 
       Stadium: value["Stadium"], 
       Time: value["Time"],
         id: key,
       Date: DateFormat("yyyy-MM-dd hh:mm:ss").parse(value["Date"])));

    });
    setState(() {
       MatchList=LoadedList;
    });
 
    }catch(error){
      
    }
  }
  
  void initState(){
   fetchmatches();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xFF5a5a5a),
      drawer: DrawerScreen(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color (0xff12c387),
     
        title: Text("OTF Score",
        style: TextStyle(
          color: Colors.black
        ),),
      ),
      body:
      Container(
        child:
        
        ListView(

          physics: BouncingScrollPhysics(), // this just for bouncing when scrolled
          children: [
            
            ...MatchList.map((e) =>
            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MatchDetailScreen(
                      Team1: e.Team1,
                      Team2: e.Team2,
                      ImageUrl: e.ImageUrl,
                      Date: e.Date,
                      Time: e.Time,
                      Stadium: e.Stadium,
                      Referee: e.referee,
                      League: e.League
                      )));
                },
            
                
                    child: matches(Team1: e.Team1,Team2: e.Team2, imageurl: e.ImageUrl))
            ).toList(),
            

          ])),
    

    );
  }
}