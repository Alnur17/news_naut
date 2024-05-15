import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_naut/widgets/breaking_news_card.dart';

import '../constant/color_palate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showGif = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _showGif = false;
      });
    });
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
        titleSpacing: 16,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //     DrawerButton(style: ButtonStyle(iconColor:
            //     MaterialStateProperty.all(textGold),
            //       iconSize: MaterialStateProperty.all(32),
            //
            // ),
            //     onPressed: () {},
            //     ),
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
            )
          ],
        ),
      ),
      body: Column(
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
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BreakingNewsCard(
                  image:
                      'https://plus.unsplash.com/premium_photo-1671019820530-728527dec7e4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  tag: 'Breaking News 1',
                  time: '1 days ago',
                  title: 'Save the world',
                  author: 'Hridoy',
                ),
                BreakingNewsCard(
                  image:
                      'https://plus.unsplash.com/premium_photo-1671019820530-728527dec7e4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  tag: 'Breaking News 1',
                  time: '1 days ago',
                  title: 'Save the world',
                  author: 'Hridoy',
                ),
                BreakingNewsCard(
                  image:
                      'https://plus.unsplash.com/premium_photo-1671019820530-728527dec7e4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  tag: 'Breaking News 1',
                  time: '1 days ago',
                  title: 'Save the world',
                  author: 'Hridoy',
                ),
                BreakingNewsCard(
                  image:
                      'https://plus.unsplash.com/premium_photo-1671019820530-728527dec7e4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  tag: 'Breaking News 1',
                  time: '1 days ago',
                  title: 'Save the world',
                  author: 'Hridoy',
                ),
              ],
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
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: searchField,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: matteBlack,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://plus.unsplash.com/premium_photo-1671019820530-728527dec7e4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                            color: textGold,
                          )),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'This is the title for the news feed for you',
                          style: styleWB20,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('1 hours ago'),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: textBlue,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Hridoy vai',
                              style: styleWB12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
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
