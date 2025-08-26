import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

class ApiManager {
  static const String baseUrl = 'https://newsapi.org/v2/';
  static const String apiKey = 'apiKey=94637d84d8a04eb788af970acb6868ec';

  static Future<List<Articles>> getNews([String? source, String? category])async{
    var url = Uri.parse("${baseUrl}top-headlines?$apiKey${source == null?"" :"&sources=$source"}${category == null?"" :"&category=$category"}");
    var response = await http.get(url);
    var json =jsonDecode(response.body);
    var data = NewsModel.fromJson(json);
    return data.articles??[];
  }
  static Future<List<Source>> getSources(String category) async {
    List<Source> sources = [];
    var url = Uri.parse("${baseUrl}top-headlines/sources?$apiKey&category=$category");
    var response = await http.get(url);
    var json =jsonDecode(response.body);
    for(var e in json["sources"]){
      sources.add(Source.fromJson(e));
    }
    return sources;
  }

}