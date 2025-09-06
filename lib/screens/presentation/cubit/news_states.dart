import 'package:news_app/models/news_model.dart';

abstract class NewsStates {}

class InitState extends NewsStates {}

class GetNewsLoadingState extends NewsStates {}

class GetNewsSuccessState extends NewsStates {
  List<Articles> articles;
  GetNewsSuccessState(this.articles);
}

class GetNewsErrorState extends NewsStates {
  String error;
  GetNewsErrorState(this.error);
}

class GetSourceLoadingState extends NewsStates {}

class GetSourceSuccessState extends NewsStates {
  List<Source> sources;
  GetSourceSuccessState(this.sources);
}

class GetSourceErrorState extends NewsStates {
  String error;
  GetSourceErrorState(this.error);
}