import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_naut/constant/color_palate.dart';
import 'package:news_naut/controller/news_controller.dart';

import '../data/dummy_data.dart';
import '../widgets/newstile.dart';
import 'news_detail_screen.dart';

class SeeAllNewsForYou extends StatelessWidget {
  const SeeAllNewsForYou({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.find();
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: newsController.recNewsList.map((news) {
              return NewsTile(
                image: news.urlToImage ?? defaultImage,
                time: news.publishedAt,
                title: news.title,
                author: news.author ?? 'Unknown',
                ontap: () {
                  Get.to(() => NewsDetailPage(
                    news: news,
                  ));
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
