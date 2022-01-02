import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  String title;
  String imgurl;

  NewsCard({required this.title, required this.imgurl});

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Card(
          //margin: EdgeInsets.all(8),
          child: Image.network(widget.imgurl))),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            child: Text(
              widget.title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
