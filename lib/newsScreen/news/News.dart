import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:term_roject/Model/NewsMode.dart';
import 'package:term_roject/newsScreen/Screens/fifthScreen.dart';
import 'package:term_roject/newsScreen/Screens/fourthScreen.dart';
import 'package:term_roject/newsScreen/Screens/secondScreen.dart';
import 'package:term_roject/newsScreen/Screens/thirdScreen.dart';
import 'package:http/http.dart' as http;
import 'package:term_roject/newsScreen/news/NewsWidget.dart';


class UserNews  extends StatefulWidget {
  @override
  State<UserNews> createState() => _UserNewsState();
}

class _UserNewsState extends State<UserNews> {
  List<newsmodel> newslist=[
    // newsmodel(title: "Lineol messi scored a screamer in the Uefa Cup against poor form Man Utd", 
    // imgurl: "https://th.bing.com/th/id/R.06a1cf5149af89a5ab16be1e1d7ef4cd?rik=FJtYyTKTfk3%2bWA&riu=http%3a%2f%2fwww.jogadores.pt%2fwp-content%2fuploads%2f2016%2f08%2f000_C34TX.jpg&ehk=DRz311CAD54jA5TLDyJTvSlpJqEwiJB9tYfaspxLpVs%3d&risl=&pid=ImgRaw&r=0", 
    ];
     Future<void> fetchNews() async{
    final url =Uri.parse("https://otf-score-902d5-default-rtdb.firebaseio.com/News.json");
    try{
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
     final List<newsmodel> LoadedList = [];
    extractedData.forEach((key, value) {
     LoadedList.add(newsmodel(
       title: value["Title"], 
       imgurl: value["Imgurl"], 
     ));

    });
    setState(() {
       newslist=LoadedList;
    });
 
    }catch(error){
    
    }
  }
  void initState(){
   fetchNews();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5a5a5a),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff12c387),
        title : Text(
          'News',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color : Colors.black,
          ),
        ),
        centerTitle : true,


      ),

      body : ListView(
        children: <Widget>[
              ...newslist.map((e) => NewsCard(
                title: e.title,
                imgurl: e.imgurl
              )).toList()         
        ],
      ),

      );
  }
}