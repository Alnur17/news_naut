import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:news_naut/models/news_model.dart';

class NewsController extends GetxController {
  //final String apikey = 'b534a9f07b044a3ea133b2c90712c7f5';
  final String apikey = '9e92677796a64e58a96b99d897200d90';
  final String baseUrl = 'https://newsapi.org/v2/everything?q=all&sortBy=publishedAt&apiKey=9e92677796a64e58a96b99d897200d90';
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


  var recNewsList = <NewsModel>[].obs;
  Future<void> recommendedNews() async {
    try {
      final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=all&sortBy=relevancy&apiKey=9e92677796a64e58a96b99d897200d90'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['articles'];
        print("popularity - ${data.length}");
        recNewsList.value =
            data.map((json) => NewsModel.fromJson(json)).where((article) => article.urlToImage != null).toList();
        print(recNewsList.length);
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
