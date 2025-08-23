import 'package:flutter/cupertino.dart';
import 'package:news_app/api_manager/api_manager.dart';
import 'package:news_app/models/news_model.dart';

class TabBarProvider extends ChangeNotifier{
  List<Source> sources = [];
  Future<void> getSources(String categoryId) async{
    sources= await ApiManager.getSources(categoryId);
    notifyListeners();
  }

}