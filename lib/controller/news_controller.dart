import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:news_naut/models/news_model.dart';

class NewsController extends GetxController {
  final String apikey = 'b534a9f07b044a3ea133b2c90712c7f5';
  final String baseUrl = 'https://newsapi.org/v2/everything?q=all&sortBy=publishedAt&apiKey=b534a9f07b044a3ea133b2c90712c7f5';
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
          'https://newsapi.org/v2/everything?q=$query&sortBy=publishedAt&apiKey=$apikey'));
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

  var categoryNewsList = <NewsModel>[].obs;

  Future<void> getNewsByCategory(String query) async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?q=$query&sortBy=publishedAt&apiKey=$apikey'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['articles'];
        categoryNewsList.value =
            data.map((json) => NewsModel.fromJson(json)).where((article) => article.urlToImage != null).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print(e);
    }
  }
}
