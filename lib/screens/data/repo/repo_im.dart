import 'dart:convert';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/data/data_source/local_data_source/local_data_imp.dart';
import 'package:news_app/screens/data/data_source/local_data_source/local_data_source.dart';
import 'package:news_app/screens/data/data_source/remote_data_source/remote_data_imp.dart';
import 'package:news_app/screens/data/data_source/remote_data_source/remote_data_source.dart';

import 'newsrepo.dart';

class NewsRepoImp implements NewsRepo {
  late RemoteDataSource remoteDataSource;
  late LocalDataSource localDataSource;
  @override
  Future<List<Articles>> getNews([String? source, String? category]) async {
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;
    if (isConnected) {
      remoteDataSource = RemoteDataImp();
      localDataSource = LocalDataImp();
      var response = await remoteDataSource.getNews(source, category);
      var json = jsonDecode(response.body);
      await localDataSource.saveSources(json);
      var data = NewsModel.fromJson(json);
      return data.articles ?? [];
    } else {
      localDataSource = LocalDataImp();
      return [];
    }
  }

  @override
  Future<List<Source>> getSources(String category) async {
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;
    if (isConnected) {
      List<Source> sources = [];
      remoteDataSource = RemoteDataImp();
      localDataSource = LocalDataImp();
      var response = await remoteDataSource.getSources(category);
      var json = jsonDecode(response.body);
      await localDataSource.saveSources(json);

      for (var e in json["sources"]) {
        sources.add(Source.fromJson(e));
      }
      return sources;
    } else {
      List<Source> sources = [];

      localDataSource = LocalDataImp();
      var json = await localDataSource.getSources();
      for (var e in json["sources"]) {
        sources.add(Source.fromJson(e));
      }
      return sources;
    }
  }
}
