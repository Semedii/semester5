import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:term_roject/Discussions%20Screen/DiscussionWIdget.dart';
import 'package:term_roject/Discussions%20Screen/newDiscussion.dart';
import 'package:term_roject/Model/Discussions.dart';
import 'package:http/http.dart' as http;


class discussion extends StatefulWidget {
  const discussion({Key? key}) : super(key: key);

  @override
  _discussionState createState() => _discussionState();
}

class _discussionState extends State<discussion> {
  List<DiscussionData> DiscussionList = [

  ];
   Future<void> fetchDiscussions() async{
    final url =Uri.parse("https://oftscore-default-rtdb.firebaseio.com/Discussions.json");
    try{
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
     final List<DiscussionData> LoadedList = [];
    extractedData.forEach((key, value) {
     LoadedList.add(DiscussionData(
       Team1: value["Team1"], 
       Team2: value["Team2"], 
       Time: value["Time"], 
       Predictions: value["Prediction"], 
      Date: DateFormat("yyyy-MM-dd hh:mm:ss").parse(value["Date"])));

    });
    setState(() {
       DiscussionList=LoadedList;
    });
 
    }catch(error){
      throw(error);
    }
  }
   void _addNewDiscussion(String Team1, String Team2, DateTime Date, String Time, String Prediction) {
    final url = Uri.parse("https://oftscore-default-rtdb.firebaseio.com/Discussions.json");
    http.post(url, body: json.encode({
      'Team1': Team1,
      'Team2': Team2,
      'Date': Date.toString(),
      "Time": Time,
      "Prediction": Prediction,
    
    }));
   final newDiscs = DiscussionData(
     Team1: Team1,
     Team2: Team2,
     Date: Date,
     Time: Time,
     Predictions: Prediction,
   );
    setState(() {
      DiscussionList.add(newDiscs);
    });
     Navigator.of(context).pop();
   }
   void _ShowAddingBox(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewDiscussion(_addNewDiscussion),
          
        );
      },
    );
  }
  void initState(){
   fetchDiscussions();
  }
  
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF5a5a5a),
          scaffoldBackgroundColor:Color(0xFF5a5a5a)
      ),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
           actions: [
        IconButton(onPressed: (){
         _ShowAddingBox(context);
        }, icon: Icon(Icons.add,
        color: Colors.black,))
      ],
          title: Text('Discussions',
            style: TextStyle(
              color: Colors.black,
            ),),
          centerTitle: true,
          backgroundColor: Color(0xff12c387),
        ),
        body: ListView(
          children: [
           ...DiscussionList.map((e) => 
             DiscussionCard(
               TeamA: e.Team1,
               TeamB: e.Team2,
               Date: e.Date,
               Time: e.Time,
               Prediction: e.Predictions,
               ),
           ).toList(),
          ],
        ),


      ),

    );
  }
}
