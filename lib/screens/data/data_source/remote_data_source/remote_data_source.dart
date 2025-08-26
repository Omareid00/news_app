import 'package:http/http.dart';

abstract class RemoteDataSource {
  Future<Response> getNews([String? source,String? category]);
  Future<Response> getSources(String category);

}