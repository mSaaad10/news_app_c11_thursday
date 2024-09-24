import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c11_thursday/data/api_manager/api_manager.dart';
import 'package:news_app_c11_thursday/data/api_manager/model/news_response/Article.dart';
import 'package:news_app_c11_thursday/data/data_source_contract/news_data_source.dart';
import 'package:news_app_c11_thursday/data/data_source_impl/news_datasource_impl.dart';
import 'package:news_app_c11_thursday/data/repository_impl/news_repository_impl.dart';
import 'package:news_app_c11_thursday/repository_contract/news_repository.dart';

class NewsListViewModel extends Cubit<NewsListState> {
  late NewsRepository repository;
  late NewsDataSource dataSource;
  late ApiManager apiManager;

  NewsListViewModel() : super(LoadingState()) {
    apiManager = ApiManager();
    dataSource = NewsDataSourceImpl(apiManager: apiManager);
    repository = NewsRepositoryImpl(dataSource: dataSource);
  }

  void getNews(String? sourceId) async {
    emit(LoadingState());
    try {
      var articles = await repository.getNews(sourceId);
      emit(SuccessState(articles: articles));
      // if (response.status == 'error') {
      //   emit(ErrorState(errorMessage: response.message));
      // } else {
      //   emit(SuccessState(articles: response.articles));
      // }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class NewsListState {}

class LoadingState extends NewsListState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class ErrorState extends NewsListState {
  String? errorMessage;

  ErrorState({this.errorMessage});
}

class SuccessState extends NewsListState {
  List<Article>? articles;

  SuccessState({this.articles});
}
