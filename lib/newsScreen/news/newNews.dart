import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class newNews extends StatefulWidget {
 final addDSC;
 newNews(this.addDSC);
  @override
  _newNewsState createState() => _newNewsState();
}

class _newNewsState extends State<newNews> {
   final ImgurlController = TextEditingController();

  final TitleController = TextEditingController();
   final DescriptionController = TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
             
                TextField(
                  decoration: InputDecoration(labelText: "ImageUrl"),
                  controller: ImgurlController,
                ),
              
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: TitleController,
                ),
              TextField(
                decoration: InputDecoration(labelText: "Description"),
                controller: DescriptionController,
              ),
            
              FlatButton(
                onPressed: () {
                  widget.addDSC(
                      ImgurlController.text,
                      TitleController.text,
                    DescriptionController.text
                      );
                },
                child: Text("Add News"),
                textColor: Colors.purple,
              ),
            ],
          )),
    );
  }
}
