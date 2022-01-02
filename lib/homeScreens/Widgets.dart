import 'package:flutter/material.dart';

class matches extends StatelessWidget {
  String Team1;
  String Team2;
  String imageurl;
  matches({required this.Team1,required this.Team2,required this.imageurl});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;// this will get the size of the phone 
    return  Stack(
            children: [
                Container(
            margin: EdgeInsets.all(9),
            height: 180,
            width: size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:

          Image.network(imageurl, fit: BoxFit.cover)
          )),
          Positioned.fill(
            bottom: 20,
            child: Align(
              alignment: Alignment.bottomCenter,
    
            child: 
            
            Text("$Team1 vs $Team2", style: TextStyle(color: Colors.grey, fontSize: 30, backgroundColor: Colors.black),)
            ))
          ],);
  }
}

class Lineup extends StatefulWidget {
 
  String name1;
  String name2;
  Lineup(this.name1, this.name2);
  @override
  _LineupState createState() => _LineupState();
}

class _LineupState extends State<Lineup> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Row( 
                
                children: [
                   Icon(Icons.sports_soccer,
                     color: Colors.white,),
                    Text(widget.name1,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                    )
                ]
              ),
              Spacer(

              ),
               Row(
             
                    children: [
                    
                    Text(widget.name2,
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                    Icon(Icons.sports_soccer,
                    color: Colors.white,),
                  ],
                  ),
      ],
    );
  }
}