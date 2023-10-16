import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/NewsModel.dart';
import '../../services/newsServices.dart';

class NewsController extends GetxController {
  final NewsService _newsService = NewsService();
  Map<String, List<NewsModel>> newsData = {};

  List<NewsModel>? getNewsByCategory(String category) {
    return newsData[category];
  }

 void onInit() async {
    super.onInit();
    await fetchNewsData();
  }

  fetchNewsData() async {
    try {
      final data = await _newsService.fetchNewsData();
      final newsList = List<NewsModel>.from(
        data.map((article) => Articles(
              title: article['title'],
              description: article['description'],
              urlToImage: article['urlToImage'],
            )),
      );

      newsData = newsList;
      update();
    } catch (e) {
      // Handle error
      print('Error fetching news data: $e');
    }
  }
}
