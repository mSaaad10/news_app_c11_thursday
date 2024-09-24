import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c11_thursday/data/api_manager/model/news_response/News_response.dart';
import 'package:news_app_c11_thursday/data/api_manager/model/sources_response/SourcesResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = 'be69a84c535c43928fdad67c7cd21548';

  Future<SourcesResponse> getSources(String catId) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': catId,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var sourcesResponse = SourcesResponse.fromJson(json);

    return sourcesResponse;
  }

//https://newsapi.org/v2/everything?q=bitcoin&apiKey=be69a84c535c43928fdad67c7cd21548
  Future<NewsResponse> getNews({String? sourceId, String? searchWord}) async {
    var url = Uri.https(baseUrl, '/v2/everything',
        {'apiKey': apiKey, 'sources': sourceId, 'q': searchWord});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
