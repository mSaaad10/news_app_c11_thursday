import 'package:news_app_c11_thursday/data/api_manager/model/news_response/Article.dart';

abstract class NewsDataSource {
  Future<List<Article>?> getNews(String? sourceId);
}
