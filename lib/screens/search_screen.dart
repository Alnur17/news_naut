
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_naut/controller/news_controller.dart';
import 'package:news_naut/screens/news_detail_screen.dart';
import 'package:news_naut/widgets/newstile.dart';
import '../constant/color_palate.dart';
import '../constant/style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final NewsController newsController = Get.find();
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  void _onSearchChanged(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _isSearching = true;
      });
      newsController.searchNews(query);
    } else {
      setState(() {
        _isSearching = false;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        titleSpacing: 12,
        leadingWidth: 34, // automatically generated back button space
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search news...',
              hintStyle: styleSFB16,
              border: InputBorder.none,

            ),
            cursorColor: justWhite,
            style: styleWB16,
            onChanged: _onSearchChanged,
          ),
        ),
        backgroundColor: background,
        iconTheme: const IconThemeData(color: textGold),
      ),
      body: Obx(() {
        var newsList = _isSearching
            ? newsController.searchList
            : newsController.breakingNewsList;
        if (newsList.isEmpty) {
          return const Center(child: CircularProgressIndicator(color: textGold,));
        } else {
          return ListView.builder(
            padding: const EdgeInsets.only(top: 12,bottom: 8),
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              final news = newsList[index];
              return NewsTile(
                image: news.urlToImage!,
                time: news.publishedAt,
                title: news.title,
                author: news.author ?? 'Unknown',
                ontap: () {
                  Get.to(() => NewsDetailPage(news: news));
                },
              );
            },
          );
        }
      }),
    );
  }
}
