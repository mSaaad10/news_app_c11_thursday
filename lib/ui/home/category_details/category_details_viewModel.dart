import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c11_thursday/data/api_manager/api_manager.dart';
import 'package:news_app_c11_thursday/data/api_manager/model/sources_response/Sources.dart';
import 'package:news_app_c11_thursday/data/data_source_contract/news_source_datasource.dart';
import 'package:news_app_c11_thursday/data/data_source_impl/news_source_datasource_impl.dart';
import 'package:news_app_c11_thursday/data/repository_impl/news_source_repository_impl.dart';
import 'package:news_app_c11_thursday/repository_contract/news_sources_repository.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  late NewsSourcesRepository repository;
  late NewsSourceDataSource dataSource;
  late ApiManager apiManager;

  CategoryDetailsViewModel() : super(LoadingState(message: 'Loading...')) {
    apiManager = ApiManager();
    dataSource = NewsSourceDatasourceImpl(apiManager: apiManager);
    repository = NewsSourceRepositoryImpl(datasource: dataSource);
  }

  void getSourcesList(String catId) async {
    emit(LoadingState(message: 'Loading...'));
    try {
      var sourcesList = await repository.getSources(catId);
      emit(SuccessState(sourcesList: sourcesList));
      // if(response.status == 'error'){
      //   emit(ErrorState(errorMessage: response.message));
      //
      // }else{
      //   emit(SuccessState(sourcesList: response.sources));
      // }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class CategoryDetailsState {}

class LoadingState extends CategoryDetailsState {
  String? message;

  LoadingState({this.message});
}

class ErrorState extends CategoryDetailsState {
  String? errorMessage;

  ErrorState({this.errorMessage});
}

class SuccessState extends CategoryDetailsState {
  List<Source>? sourcesList;

  SuccessState({this.sourcesList});
}
