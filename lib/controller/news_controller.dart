import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:news_naut/constant/urls.dart';
import 'package:news_naut/models/news_model.dart';

class NewsController extends GetxController {

  var breakingNewsList = <NewsModel>[].obs;

  Future<void> getBreakingNews() async {
    try {
      final response = await http.get(Uri.parse(Urls.everything));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['articles'];
        breakingNewsList.value = data
            .map((json) => NewsModel.fromJson(json))
            .where((article) => article.urlToImage != null)
            .toList();
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
      final response = await http.get(Uri.parse(Urls.relevance));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['articles'];
        recNewsList.value = data
            .map((json) => NewsModel.fromJson(json))
            .where((article) => article.urlToImage != null)
            .toList();
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
      final response = await http.get(Uri.parse(Urls.searching(query)));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['articles'];
        searchList.value = data
            .map((json) => NewsModel.fromJson(json))
            .where((article) => article.urlToImage != null)
            .toList();
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
      final response = await http.get(Uri.parse(Urls.searching(query)));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['articles'];
        categoryNewsList.value = data
            .map((json) => NewsModel.fromJson(json))
            .where((article) => article.urlToImage != null)
            .toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      print(e);
    }
  }
}
