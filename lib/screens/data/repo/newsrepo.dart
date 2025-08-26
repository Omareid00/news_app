import 'package:news_app/models/news_model.dart';

abstract class NewsRepo{
  Future<List<Articles>> getNews(String? source, String? category);
  Future<List<Source>> getSources(String category);
}