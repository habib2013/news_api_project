import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api_project/widgets/headline_slider.dart';
import 'package:news_api_project/widgets/hot_news.dart';
import 'package:news_api_project/widgets/top_channels.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
    children: [
      HeadlineSlider(),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Top Channels",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17.0,

        ),),
      ),
      TopChannels(),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Hot News",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17.0,

        ),),
      ),
     HotNews(),
    ],
    );
  }
}
