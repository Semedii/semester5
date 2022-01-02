import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:term_roject/Model/Matches.dart';
import 'package:term_roject/homeScreens/drawerLoggedIn.dart';
import 'package:term_roject/homeScreens/newMatch.dart';
import 'package:term_roject/homeScreens/MatchDetail.dart';
import 'package:term_roject/homeScreens/Widgets.dart';
import 'package:term_roject/homeScreens/drawer.dart';
import 'package:http/http.dart' as http;

//this homepage screen has the following
// A stack. and inside the stack are a     listview where you can add the new matches 
// the matches is a class with two parameters (the two teams)
// and also there Row with three different buttons in the stack.
//those three different buttons will navigate to three different screens
//inside the appbar there is settings which will navigate to setting screen and...
//..main menu where you can login or sign up.


class MyHomePageAdmin extends StatefulWidget {
 

  @override
  _MyHomePageAdminState createState() => _MyHomePageAdminState();
}

class _MyHomePageAdminState extends State<MyHomePageAdmin> {
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
       Date: DateFormat("yyyy-MM-dd hh:mm:ss").parse(value["Date"])));

    });
    setState(() {
       MatchList=LoadedList;
    });
 
    }catch(error){
      throw(error);
    }
  }
  void _addNewMatch(String Team1, String Team2, String img, String league, String Stadium, String refree, DateTime date, String time) {
    final url = Uri.parse("https://oftscore-default-rtdb.firebaseio.com/matches.json");

    http.post(url, body: json.encode({
      'Team1': Team1,
      'Team2': Team2,
      'ImageUrl': img,
      "Date": date.toString(),
      "Time": time,
      "League": league,
      "Stadium": Stadium,
      "referee": refree

    }));
    final newmtch = Matches(
      Team1: Team1,
      Team2: Team2,
      ImageUrl: img,
      League: league,
      Stadium: Stadium,
      referee: refree,
      Date: date,
      Time: time,
    );

    setState(() {
      MatchList.add(newmtch);
    });
    Navigator.of(context).pop();
  //   for(int i=0; i<MatchList.length; i++){
  //   print(MatchList[i].Team1);
  // }
  }
 
  

void _ShowAddingBox(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewMatch(admtch: _addNewMatch),
          
        );
      },
    );
  }
  void initState(){
   fetchmatches();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(0xFF5a5a5a),
      drawer: DrawerScreenL(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color (0xff12c387),
      actions: [
        IconButton(onPressed: (){
         _ShowAddingBox(context);
        }, icon: Icon(Icons.add,
        color: Colors.black,))
      ],
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