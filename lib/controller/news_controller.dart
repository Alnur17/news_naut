import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:news_naut/models/news_model.dart';

class NewsController extends GetxController {
  final String apikey = 'a84f185b98954f73bfadede65e6e435f';
  final String baseUrl = 'https://newsapi.org/v2/everything?q=all&sortBy=publishedAt&apiKey=a84f185b98954f73bfadede65e6e435f';
  var breakingNewsList = <NewsModel>[].obs;

  Future<void> getBreakingNews() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['articles'];
        breakingNewsList.value =
            data.map((json) => NewsModel.fromJson(json)).where((article) => article.urlToImage != null).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print(e);
    }
  }

  var searchList = <NewsModel>[].obs;

  Future<void> searchNews(String query) async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?q=$query&from=2024-04-20&sortBy=publishedAt&apiKey=$apikey'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['articles'];
        searchList.value =
            data.map((json) => NewsModel.fromJson(json)).where((article) => article.urlToImage != null).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print(e);
    }
  }
}
