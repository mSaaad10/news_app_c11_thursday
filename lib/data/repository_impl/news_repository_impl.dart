import 'package:news_app_c11_thursday/data/api_manager/model/news_response/Article.dart';
import 'package:news_app_c11_thursday/data/data_source_contract/news_data_source.dart';
import 'package:news_app_c11_thursday/repository_contract/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  NewsDataSource dataSource;

  NewsRepositoryImpl({required this.dataSource});

  @override
  Future<List<Article>?> getNews(String? sourceId) {
    return dataSource.getNews(sourceId);
  }
}
