import 'package:dio/dio.dart';
import 'package:news_api_project/model/article_response.dart';
import 'package:news_api_project/model/source_response.dart';

class NewsRepository {
  static String mainUrl = "http://newsapi.org/v2";
  final String apiKey = "814c2572e4ee4517a676a3cafead582d";

  final Dio _dio = Dio();

    var getSourceUrl = '$mainUrl/sources';
    var getTopHeadlinesUrl = "$mainUrl/top-headlines";
    var everythingUrl = "$mainUrl/everything";

    Future<SourceResponse> getSource() async {
      var params = {
        "apiKey":  apiKey,
        "language": "en",
        "country": "us"
      };
      try{
        Response response = await _dio.get(getSourceUrl,queryParameters: params);
        return SourceResponse.fromJson(response.data);

      }
      catch(error,stacktrace) {
        print("Exception occured: $error stacktrace: $stacktrace");
        return SourceResponse.withError(error);
      }
    }

    Future<ArticleResponse> getTopHeadlines() async {
      var params = {
        "apiKey":  apiKey,
        "country": "us"
      };
      
      try {
        Response response = await _dio.get(getTopHeadlinesUrl,queryParameters: params);
        return ArticleResponse.fromJson(response.data);

      }
      catch(error){
        return ArticleResponse.withError(error);
      }
    }

  Future<ArticleResponse> getHotNews() async {
    var params = {
      "apiKey":  apiKey,
      "q": "apple",
      "sortBy": "popularity"
    };
    try {
      Response response = await _dio.get(everythingUrl,queryParameters: params);
      return ArticleResponse.fromJson(response.data);

    }
    catch(error){
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> getSourceNews(String sourceId) async {
    var params = {
      "apiKey":  apiKey,
      "sources": sourceId
    };
    try {
      Response response = await _dio.get(getTopHeadlinesUrl,queryParameters: params);
      return ArticleResponse.fromJson(response.data);

    }
    catch(error){
      return ArticleResponse.withError(error);
    }
  }

  Future<ArticleResponse> Search(String searchValue) async {
    var params = {
      "apiKey":  apiKey,
      "q": searchValue
    };
    try {
      Response response = await _dio.get(getTopHeadlinesUrl,queryParameters: params);
      return ArticleResponse.fromJson(response.data);

    }
    catch(error){
      return ArticleResponse.withError(error);
    }
  }

}