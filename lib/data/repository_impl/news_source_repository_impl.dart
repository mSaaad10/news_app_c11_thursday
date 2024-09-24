import 'package:news_app_c11_thursday/data/api_manager/model/sources_response/Sources.dart';
import 'package:news_app_c11_thursday/data/data_source_contract/news_source_datasource.dart';
import 'package:news_app_c11_thursday/repository_contract/news_sources_repository.dart';

class NewsSourceRepositoryImpl extends NewsSourcesRepository {
  NewsSourceDataSource datasource;

  NewsSourceRepositoryImpl({required this.datasource});

  @override
  Future<List<Source>?> getSources(String categoryId) {
    return datasource.getSources(categoryId);
  }
}
