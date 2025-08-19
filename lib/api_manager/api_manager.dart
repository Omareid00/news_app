import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

class ApiManager {
  static const String _baseUrl = 'https://newsapi.org/v2/';

  static Future<List<Articles>> getNews()async{
    var url = Uri.parse("${_baseUrl}everything?q=a&apiKey=36e2bb9be67944e8ade48e3d88828c89");
    var response = await http.get(url);
    var json =jsonDecode(response.body);
    var data = NewsModel.fromJson(json);
    return data.articles??[];
  }

}