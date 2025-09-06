import 'package:http/http.dart'as http;
import 'package:http/src/response.dart' ;
import 'package:news_app/api_manager/api_manager.dart';
import 'package:news_app/screens/data/data_source/remote_data_source/remote_data_source.dart';

class RemoteDataImp implements RemoteDataSource{
  @override
  Future<Response> getNews([String? source, String? category]) async {
    var url = Uri.parse("${ApiManager.baseUrl}top-headlines?${ApiManager.apiKey}${source == null?"" :"&sources=$source"}${category == null?"" :"&category=$category"}");
    var response = await http.get(url);
    return response;
  }

  @override
  Future<Response> getSources(String category) async {
    var url = Uri.parse("${ApiManager.baseUrl}top-headlines/sources?${ApiManager.apiKey}&category=$category");
    var response = await http.get(url);
    return response;
  }

}