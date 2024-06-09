import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_naut/controller/news_controller.dart';
import 'package:news_naut/screens/category_screen.dart';
import 'package:news_naut/screens/news_detail_screen.dart';
import 'package:news_naut/screens/search_screen.dart';
import 'package:news_naut/screens/see_all_breaking_news.dart';
import 'package:news_naut/screens/see_all_news_for_you.dart';
import 'package:news_naut/widgets/bottom_sheet.dart';
import 'package:news_naut/widgets/breaking_news_card.dart';
import 'package:news_naut/widgets/newstile.dart';

import '../constant/color_palate.dart';
import '../constant/style.dart';
import '../data/dummy_data.dart';

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

    initializer();
  }

  initializer()async{
    await newsController.getBreakingNews();
    await newsController.recommendedNews();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget buildCategoryChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 8, right: 12),
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(left: 4),
            child: ChoiceChip(
              padding: const EdgeInsets.all(12),
              label: Text(
                category,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              selected: false,
              onSelected: (bool selected) {
                Get.to(() => CategoryScreen(category: category));
              },
              backgroundColor: containerColor,
              //Customize the background color
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }).toList(),
      ),
    );
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
        titleSpacing: 12,
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
              onTap: () {
                Get.to(() => const SearchScreen());
              },
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
      body: Obx(() {
        if (newsController.breakingNewsList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: textGold,
            ),
          );
        } else {
          return RefreshIndicator(
            backgroundColor: searchField,
            color: textGold,
            onRefresh: () async {
              await initializer();
            },
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Breaking News',
                        style: styleWB20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const SeeAllBreakingNews());
                        },
                        child: const Text(
                          'See all',
                          style: styleWB16,
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: Row(
                    children: newsController.breakingNewsList.map((news) {
                      return BreakingNewsCard(
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
                buildCategoryChips(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 12, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'News for you',
                        style: styleWB20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const SeeAllNewsForYou());
                        },
                        child: const Text(
                          'See all',
                          style: styleWB16,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
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
              ],
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomSheets(context);
        },
        shape: const CircleBorder(side: BorderSide(width: 1, color: textGold)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset('assets/images/Rectangle1.png'),
        ),
      ),
    );
  }
}
