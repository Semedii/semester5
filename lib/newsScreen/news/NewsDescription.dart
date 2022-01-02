import 'package:flutter/material.dart';
import 'package:term_roject/Favourite%20Screen/fav.dart';

class newsDetail extends StatefulWidget {
  String imgurl;
  String Description;
  newsDetail({required this.Description, required this.imgurl});

  @override
  _newsDetailState createState() => _newsDetailState();
}

class _newsDetailState extends State<newsDetail> {
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

    body: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8)
          ),
          margin: EdgeInsets.all(8),
            child: Image.network(widget.imgurl),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(widget.Description, style: TextStyle(color: Colors.white, fontSize: 20),),
          ),
      ],
    ));
  }
}
