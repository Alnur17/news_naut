import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_naut/controller/news_controller.dart';
import 'package:news_naut/screens/category_screen.dart';
import 'package:news_naut/screens/news_detail_screen.dart';
import 'package:news_naut/screens/search_screen.dart';
import 'package:news_naut/widgets/bottom_sheet.dart';
import 'package:news_naut/widgets/breaking_news_card.dart';
import 'package:news_naut/widgets/newstile.dart';

import '../constant/color_palate.dart';
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
  List<String> categories = [
    'Technology',
    'Business',
    'Health',
    'Sports',
    "Entertainment"
    'General',
    'Science'
  ];
  String selectedCategory = " ";

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _showGif = false;
      });
    });

    newsController.getBreakingNews();
    newsController.recommendedNews();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget buildCategoryChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 8,right: 12),
      child: Row(
        children: categories.map((category) {
          bool isSelected = category == selectedCategory;
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
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  selectedCategory = category;
                });
                Get.to(() => CategoryScreen(category: category));
              },
              selectedColor: textGold,
              // Customize the selected color
              backgroundColor: textBlue,
              // Customize the background color
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
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
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Breaking News',
                      style: styleWB20,
                    ),
                    InkWell(
                      onTap: () {},
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
                padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
                child: Row(
                  children: newsController.breakingNewsList.map((news) {
                    return BreakingNewsCard(
                      image: news.urlToImage ?? defaultImage,
                      time: news.publishedAt.toString(),
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
                padding: const EdgeInsets.only(left: 12,right: 12,top: 12,bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'News for you',
                      style: styleWB20,
                    ),
                    InkWell(
                      onTap: () {},
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
                    time: news.publishedAt.toString(),
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
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomSheets(context);
        },
        backgroundColor: textGold,
        child: const Icon(
          Icons.person,
          size: 30,
        ),
      ),
    );
  }
}
