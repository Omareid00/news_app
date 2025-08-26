import 'package:flutter/cupertino.dart';
import 'package:news_app/api_manager/api_manager.dart';
import 'package:news_app/models/news_model.dart';

class NewsProvider extends ChangeNotifier{

  List<Articles> articles = [];
  Future<void> getNews([String? source,String? category]) async{
     articles= await ApiManager.getNews(source,category);
     notifyListeners();
  }


}