import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_naut/controller/news_controller.dart';
import 'package:news_naut/screens/news_detail_screen.dart';
import 'package:news_naut/widgets/newstile.dart';
import '../constant/color_palate.dart';
import '../constant/style.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  final NewsController newsController = Get.find<NewsController>();

  CategoryScreen({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    newsController.getNewsByCategory(category);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        iconTheme:  const IconThemeData(
          color: textGold, // Change back button color
        ),
        title: Text(
          category,
          style: styleWB20,
        ),
      ),
      body: Obx(() {
        if (newsController.categoryNewsList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: textGold,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: newsController.categoryNewsList.length,
            itemBuilder: (context, index) {
              var news = newsController.categoryNewsList[index];
              return NewsTile(
                image: news.urlToImage!,
                time: news.publishedAt.toString(),
                title: news.title,
                author: news.author ?? 'Unknown',
                ontap: () {
                  Get.to(() => NewsDetailPage(
                    news: news,
                  ));
                },
              );
            },
          );
        }
      }),
    );
  }
}
