import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant/color_palate.dart';

class BreakingNewsCard extends StatelessWidget {
  final String image;
  final String tag;
  final String time;
  final String title;
  final String author;

  const BreakingNewsCard(
      {super.key,
      required this.image,
      required this.tag,
      required this.time,
      required this.title,
      required this.author});

  @override
  Widget build(BuildContext context) {
    //TextStyle a = TextStyle();
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: searchField,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(4),
            height: 200,
            width: double.infinity,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(15),
            //   color: searchField,
            // ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: textGold,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tag, style: styleWB12,),
                Text(time, style: styleWB12,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 4),
            child: Text(
              title,
              style: styleWB20,
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: textBlue,
                ),
                const SizedBox(width: 8),
                Text(
                  author,
                  style: styleWB12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
