import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/data/repo/newsrepo.dart';
import 'package:news_app/screens/data/repo/repo_im.dart';
import 'package:news_app/screens/presentation/cubit/news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit():super(InitState());
  late NewsRepo repo;
  Future<void> getNews([String? source,String? category]) async{
    emit(GetNewsLoadingState());
    try{
      repo=NewsRepoImp();
      List<Articles> articles= await repo.getNews(source,category);
      emit(GetNewsSuccessState(articles));

    }catch(e){
      emit(GetNewsErrorState(e.toString()));
    }
  }
  Future<void> getSources(String categoryId) async{
    emit(GetSourceLoadingState());
    try{
      repo=NewsRepoImp();
      List<Source> sources= await repo.getSources(categoryId);
      emit(GetSourceSuccessState(sources));
    }
    catch(e){
      emit(GetSourceErrorState(e.toString()));
    }
  }

}