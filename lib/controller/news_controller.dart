import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:news_naut/constant/urls.dart';
import 'package:news_naut/models/news_model.dart';

class NewsController extends GetxController {
  var breakingNewsList = <NewsModel>[].obs;
  var recNewsList = <NewsModel>[].obs;
  var searchList = <NewsModel>[].obs;
  var categoryNewsList = <NewsModel>[].obs;

  Future<void> getBreakingNews() async {
    try {
      final response = await http.get(Uri.parse(Urls.everything));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['articles'];
        breakingNewsList.value = data
            .map((json) => NewsModel.fromJson(json))
            .where((article) => article.urlToImage != null)
            .toList();
        print('${breakingNewsList.length} breaking news articles loaded');
      } else {
        throw Exception('Failed to load breaking news');
      }
    } catch (e) {
      print('Error loading breaking news: $e');
    }
  }

  Future<void> recommendedNews() async {
    try {
      final response = await http.get(Uri.parse(Urls.relevancy));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['articles'];
        recNewsList.value = data
            .map((json) => NewsModel.fromJson(json))
            .where((article) => article.urlToImage != null)
            .toList();
        print('${recNewsList.length} recommended news articles loaded');
      } else {
        throw Exception('Failed to load recommended news');
      }
    } catch (e) {
      print('Error loading recommended news: $e');
    }
  }

  Future<void> searchNews(String query) async {
    try {
      final response = await http.get(Uri.parse(Urls.searching(query)));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['articles'];
        searchList.value = data
            .map((json) => NewsModel.fromJson(json))
            .where((article) => article.urlToImage != null)
            .toList();
        print('${searchList.length} search results loaded');
      } else {
        throw Exception('Failed to load search results');
      }
    } catch (e) {
      print('Error loading search results: $e');
    }
  }

  Future<void> getNewsByCategory(String query) async {
    try {
      final response = await http.get(Uri.parse(Urls.searching(query)));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['articles'];
        categoryNewsList.value = data
            .map((json) => NewsModel.fromJson(json))
            .where((article) => article.urlToImage != null)
            .toList();
        print('${categoryNewsList.length} category news articles loaded');
      } else {
        throw Exception('Failed to load category news');
      }
    } catch (e) {
      print('Error loading category news: $e');
    }
  }
}
