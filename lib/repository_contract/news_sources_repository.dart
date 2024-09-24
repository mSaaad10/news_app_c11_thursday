import 'package:news_app_c11_thursday/data/api_manager/model/sources_response/Sources.dart';

abstract class NewsSourcesRepository {
  Future<List<Source>?> getSources(String categoryId);
}
