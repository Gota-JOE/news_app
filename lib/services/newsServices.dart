import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/NewsModel.dart';

class NewsService {
  final model = NewsModel();
  Future<dynamic> fetchNewsData(String category) async {
    final apiKey = 'ff07382cc1f84dc4870f8ed0d3def8b7';
    final url =
        'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return model.toJson(jsonData);
      //return jsonData['articles'];
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}
