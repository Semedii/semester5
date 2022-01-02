import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:term_roject/Model/NewsMode.dart';

import 'package:http/http.dart' as http;
import 'package:term_roject/newsScreen/news/NewsDescription.dart';
import 'package:term_roject/newsScreen/news/NewsWidget.dart';
import 'package:term_roject/newsScreen/news/newNews.dart';

class AdminNews extends StatefulWidget {
  @override
  State<AdminNews> createState() => _AdminNewsState();
}

class _AdminNewsState extends State<AdminNews> {
  List<newsmodel> newslist = [
    // newsmodel(title: "Lineol messi scored a screamer in the Uefa Cup against poor form Man Utd",
    // imgurl: "https://th.bing.com/th/id/R.06a1cf5149af89a5ab16be1e1d7ef4cd?rik=FJtYyTKTfk3%2bWA&riu=http%3a%2f%2fwww.jogadores.pt%2fwp-content%2fuploads%2f2016%2f08%2f000_C34TX.jpg&ehk=DRz311CAD54jA5TLDyJTvSlpJqEwiJB9tYfaspxLpVs%3d&risl=&pid=ImgRaw&r=0",
  ];

  Future<void> fetchNews() async {
    final url =
        Uri.parse("https://oftscore-default-rtdb.firebaseio.com/News.json");
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<newsmodel> LoadedList = [];
      extractedData.forEach((key, value) {
        LoadedList.add(newsmodel(
            id: key,
            title: value["Title"],
            imgurl: value["Imgurl"],
            Description: value["Detail"]));
      });
      setState(() {
        newslist = LoadedList;
      });
    } catch (error) {
      throw (error);
    }
  }

  void _addNewNews(String ImgUrl, String Title, String Description) {
    final url =
        Uri.parse("https://oftscore-default-rtdb.firebaseio.com/News.json");
    http.post(url,
        body: json.encode({
          'Imgurl': ImgUrl,
          'Title': Title,
          'Detail': Description,
        }));
    final newNews = newsmodel(
        id: "", imgurl: ImgUrl, title: Title, Description: Description);
    setState(() {
      newslist.add(newNews);
    });
    Navigator.of(context).pop();
  }

  void _ShowAddingBox(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: newNews(_addNewNews),
        );
      },
    );
  }

  Future<void> deleteNews(String ID) {
    print(ID);
    final url =
        Uri.parse("https://oftscore-default-rtdb.firebaseio.com/News/$ID.json");
    print("${url.toString()} pri");
    return http.delete(url).then((response) {
      // print(response.body);

      newslist.removeWhere((element) => element.id == ID);
    });
  }

  void initState() {
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5a5a5a),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff12c387),
        title: Text(
          'News',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _ShowAddingBox(context);
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView(
        children: <Widget>[
          ...newslist
              .map((e) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => newsDetail(
                                  Description: e.Description,
                                  imgurl: e.imgurl)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            deleteNews(e.id);
                            newslist
                                .removeWhere((element) => element.id == e.id);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Sucessfully Deleted')));
                        },
                        child: NewsCard(title: e.title, imgurl: e.imgurl),
                      ),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
