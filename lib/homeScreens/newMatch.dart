import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewMatch extends StatefulWidget {
  final Function admtch;
  

  NewMatch({required this.admtch});

  @override
  State<NewMatch> createState() => _NewMatchState();
}

class _NewMatchState extends State<NewMatch> {
  final team1Controller = TextEditingController();

  final team2Controller = TextEditingController();

  final imgController = TextEditingController();

  final leagueController = TextEditingController();

  final stadiumController = TextEditingController();

  final refereeController = TextEditingController();

  DateTime? chosenDate;
  void presentDate(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now().add(Duration(days: 1)), 
      firstDate: DateTime.now().add(Duration(days: 1)), 
      lastDate: DateTime(2050),
      ).then((value) {
        if(value==null){
          return;
        }
        setState(() {
           chosenDate = value;
        });
       
      });
      print("called");
  }
  String? chosenTime;
  void presentTime(){
    showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now(),
      ).then((vvalue) {
        if(vvalue==null){
          return;
        }
     
      setState(() {
        chosenTime=vvalue.format(context);
      });
       });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "TeamA"),
                    controller: team1Controller,
                  ),
                ),
                Container(margin: EdgeInsets.all(10), child: Text("Vs")),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "TeamB"),
                    controller: team2Controller,
                  ),
                ),
              ]),
              TextField(
                  decoration: InputDecoration(
                    labelText: "ImageUrl",
                  ),
                  controller: imgController),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "League",
                      ),
                      controller: leagueController,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Stadium",
                      ),
                      controller: stadiumController,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Referee",
                      ),
                      controller: refereeController,
                    ),
                  )
                ],
              ),
               Row(
                    children:[
                      Text(chosenDate==null? "No Date chosen" : DateFormat.yMd().format(chosenDate!)),
                      FlatButton(
                       textColor: Theme.of(context).primaryColor,
                       onPressed:  presentDate,
                        child: Text("Choose Date", style: TextStyle(fontWeight: FontWeight.bold),)
                        )
                    ]
                  ),
                  Row(
                    children:[
                      Text(chosenTime==null? "No Time Chosen" : chosenTime!),
                      FlatButton(
                       textColor: Theme.of(context).primaryColor,
                       onPressed:  presentTime,
                        child: Text("Choose Time", style: TextStyle(fontWeight: FontWeight.bold),)
                        )
                    ]
                  ),
              FlatButton(
                onPressed: () {
                  widget.admtch(
                      team1Controller.text,
                      team2Controller.text,
                      imgController.text,
                      leagueController.text,
                      stadiumController.text,
                      refereeController.text,
                      chosenDate,
                      chosenTime,
                      );
                },
                child: Text("Add Match"),
                textColor: Colors.purple,
              ),

            ],
          )),
    );
  }
}
