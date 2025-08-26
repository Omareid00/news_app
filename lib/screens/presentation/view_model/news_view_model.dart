import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/data/repo/newsrepo.dart';
import 'package:news_app/screens/data/repo/repo_im.dart';

class NewsProvider extends ChangeNotifier{

  List<Articles> articles = [];
  late NewsRepo repo;
  Future<void> getNews([String? source,String? category]) async{
    repo=NewsRepoImp();
     articles= await repo.getNews(source,category);
     notifyListeners();
  }


}