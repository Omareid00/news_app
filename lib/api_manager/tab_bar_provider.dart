import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/data/repo/newsrepo.dart';
import 'package:news_app/screens/data/repo/repo_im.dart';

class TabBarProvider extends ChangeNotifier{
  List<Source> sources = [];
  late NewsRepo repo;
  Future<void> getSources(String categoryId) async{
    repo=NewsRepoImp();
    sources= await repo.getSources(categoryId);
    notifyListeners();
  }

}