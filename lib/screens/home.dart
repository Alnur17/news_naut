import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_naut/controller/news_controller.dart';
import 'package:news_naut/screens/news_detail_screen.dart';
import 'package:news_naut/widgets/breaking_news_card.dart';
import 'package:news_naut/widgets/newstile.dart';

import '../constant/color_palate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showGif = true;
  Timer? _timer;
  NewsController newsController = Get.find<NewsController>();

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _showGif = false;
      });
    });

    newsController.getBreakingNews();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        iconTheme: const IconThemeData(
          color: textGold, // Change back button color
        ),
        titleSpacing: 16,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'NEWS',
                    style: styleBB24,
                  ),
                  TextSpan(
                    text: 'NAUT',
                    style: styleGB24,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: _showGif
                  ? Image.asset(
                      'assets/icons/search_blue_gold.gif',
                      width: 32,
                    )
                  : Image.asset(
                      'assets/icons/search_blue_gold_static.png',
                      width: 32,
                    ),
            ),
          ],
        ),
      ),
      body: Obx((){
        if(newsController.breakingNewsList.isEmpty){
          return const Center(child: CircularProgressIndicator(color: textGold,),);
        }else{
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Breaking News',
                    style: styleWB20,
                  ),
                  Text(
                    'See all',
                    style: styleWB16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: newsController.breakingNewsList.map((news) {
                    return BreakingNewsCard(
                      image: news.urlToImage ?? 'https://plus.unsplash.com/premium_photo-1671019820530-728527dec7e4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

                      time: news.publishedAt.toString(),
                      title: news.title,
                      author: news.author ?? 'Unknown',
                      ontap: () {
                        Get.to(() =>  NewsDetailPage(news: news,));
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News for you',
                    style: styleWB20,
                  ),
                  Text(
                    'See all',
                    style: styleWB16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                children: newsController.breakingNewsList.map((news) {
                  return NewsTile(
                    image: news.urlToImage ?? 'https://plus.unsplash.com/premium_photo-1671019820530-728527dec7e4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    time: news.publishedAt.toString(),
                    title: news.title,
                    author: news.author ?? 'Unknown',
                    ontap: () {
                      Get.to(() =>  NewsDetailPage(news: news,));
                    },
                  );
                }).toList(),
              ),
            ],
          );
        }
      }),



      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: textGold,
        child: const Icon(
          Icons.person,
          size: 30,
        ),
      ),
    );
  }
}


