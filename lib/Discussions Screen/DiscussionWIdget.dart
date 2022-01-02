import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiscussionCard extends StatelessWidget {
 
  String TeamA;
  String TeamB;
  DateTime Date;
  String Time;
  String Prediction;

  DiscussionCard({required this.TeamA, required this.TeamB, required this.Date, required this.Time, required this.Prediction});
  @override
  Widget build(BuildContext context) {
    return  Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children:[ Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                       border: Border.all(color: Colors.black.withOpacity(0.4))
                      ),
                      child: Text("${TeamA}", style: TextStyle(fontSize: 20),)),
                    Text("Vs"),
                    Container(
                       padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                       border: Border.all(color: Colors.black.withOpacity(0.4))
                      ),
                      child: Text("${TeamB}", style: TextStyle(fontSize: 20),))
                  ],
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${DateFormat.yMMMd().format(Date)}", style: TextStyle(color: Colors.black45),),
                    SizedBox(width: 10),
                    Text("${Time}",style: TextStyle(color: Colors.black45))
                  ],
                ),
                Container(
                   padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                       border: Border.all(color: Colors.black.withOpacity(0.4))
                      ),
                  child: Text("${Prediction}", style: TextStyle(fontSize: 30),))
                ]),
            );
  }
}