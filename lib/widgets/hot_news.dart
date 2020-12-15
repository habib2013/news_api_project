import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_api_project/bloc/get_hotnews_bloc.dart';
import 'package:news_api_project/elements/error_element.dart';
import 'package:news_api_project/elements/loader_element.dart';
import 'package:news_api_project/model/article.dart';
import 'package:news_api_project/model/article_response.dart';
import 'package:news_api_project/model/source.dart';
import 'package:news_api_project/model/source_response.dart';

class HotNews extends StatefulWidget {
  @override
  _HotNewsState createState() => _HotNewsState();
}

class _HotNewsState extends State<HotNews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHotNewsBloc.getHotNews();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ArticleResponse>(
      stream: getHotNewsBloc.subject.stream,
      builder: (context,AsyncSnapshot<ArticleResponse> snapshot){
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return buildErrorWidget(snapshot.data.error);
          }
          return _buildHotNews(snapshot.data);
        }
        else if (snapshot.hasError){
          return buildErrorWidget(snapshot.error);
        }
        else {
          return buildLoaderWidget();
        }
      },
    );
  }
  
  Widget _buildHotNews(ArticleResponse data) {
    List<ArticleModel> articles = data.articles;


  }
}

