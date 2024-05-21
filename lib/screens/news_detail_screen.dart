import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_naut/constant/color_palate.dart';
import 'package:news_naut/models/news_model.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsModel news;
  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          'News Details',
          style: TextStyle(color: justWhite),
        ),
        iconTheme: const IconThemeData(
          color: justWhite, // Change this to the color you want for the back button
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                news.title,
                style: styleWB24,
              ),
              const SizedBox(height: 8.0),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      news.author?? 'Unknown',
                      style: styleWB16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Text(
                      news.publishedAt.toString(),
                      style: styleWB16,
                      maxLines: 1,
                    ),
                  ),
                ],
                             ),
              const SizedBox(height: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage!,
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0),
               Text(
                news.content ?? 'No contain....',
                style: styleWB18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
