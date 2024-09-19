import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c11_thursday/api_manager/model/SourcesResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = 'be69a84c535c43928fdad67c7cd21548';

  static Future<SourcesResponse> getSources(String catId) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': catId,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var sourcesResponse = SourcesResponse.fromJson(json);

    return sourcesResponse;
  }
}
