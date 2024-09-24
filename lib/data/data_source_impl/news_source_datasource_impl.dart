import 'package:news_app_c11_thursday/data/api_manager/api_manager.dart';
import 'package:news_app_c11_thursday/data/api_manager/model/sources_response/Sources.dart';
import 'package:news_app_c11_thursday/data/data_source_contract/news_source_datasource.dart';

class NewsSourceDatasourceImpl extends NewsSourceDataSource {
  late ApiManager apiManager;

  NewsSourceDatasourceImpl({required this.apiManager});

  @override
  Future<List<Source>?> getSources(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response.sources;
  }
}
