import 'package:news_api_project/bloc/get_source_news_bloc.dart';
import 'package:news_api_project/model/article_response.dart';
import 'package:news_api_project/model/source_response.dart';
import 'package:news_api_project/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class GetSourceBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<SourceResponse> _subject = BehaviorSubject<SourceResponse>();

  getSources() async {
    SourceResponse response = await _repository.getSource();
    _subject.sink.add(response);
}
 dispose(){
    _subject.close();
 }
 BehaviorSubject<SourceResponse> get subject => _subject;

}
final getSourceBloc = GetSourceBloc();  