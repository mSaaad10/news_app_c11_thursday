import 'package:news_app_c11_thursday/data/api_manager/api_manager.dart';
import 'package:news_app_c11_thursday/data/api_manager/model/news_response/Article.dart';
import 'package:news_app_c11_thursday/data/data_source_contract/news_data_source.dart';

class NewsDataSourceImpl extends NewsDataSource {
  ApiManager apiManager;

  // dependency injection
  NewsDataSourceImpl({required this.apiManager}); // constructor injection

  @override
  Future<List<Article>?> getNews(String? sourceId) async {
    var response = await apiManager.getNews(sourceId: sourceId);
    return response.articles;
  }
}
