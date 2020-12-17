import 'package:flutter/material.dart';
import 'package:news_api_project/bloc/get_source_news_bloc.dart';
import 'package:news_api_project/bloc/get_sources_bloc.dart';
import 'package:news_api_project/elements/error_element.dart';
import 'package:news_api_project/elements/loader_element.dart';
import 'package:news_api_project/model/source.dart';
import 'package:news_api_project/model/source_response.dart';
import 'package:news_api_project/screens/source_detail.dart';

class TopChannels extends StatefulWidget {
  @override
  _TopChannelsState createState() => _TopChannelsState();
}

class _TopChannelsState extends State<TopChannels> {
  @override
  void initState() {
    super.initState();
    getSourceBloc.getSources();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SourceResponse>(
      stream: getSourceBloc.subject.stream,
      builder: (context, AsyncSnapshot<SourceResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget(snapshot.data.error);
          }
          return _buildTopChannels(snapshot.data);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error);
        } else {
          return buildLoaderWidget();
        }
      },
    );
  }

  Widget _buildTopChannels(SourceResponse data) {
    List<SourceModel> sources = data.sources;
    if (sources.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [Text("No sources")],
        ),
      );
    } else {
      return Container(
        height: 90,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sources.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(top: 10.0),
                width: 80.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SourceDetail(source: sources[index],)));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: sources[index].id,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(1.0, 1.0))
                              ],
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/logos/${sources[index].id}.png")),
                          )),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        sources[index].name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.4,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          fontSize: 10.0
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      // Text(sources[index].name)
                    ],
                  ),
                ),
              );
            }),
      );
    }
  }
}
