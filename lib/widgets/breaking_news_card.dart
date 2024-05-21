import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant/color_palate.dart';

class BreakingNewsCard extends StatelessWidget {
  final String image;

  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;

  const BreakingNewsCard(
      {super.key,
      required this.image,
      required this.time,
      required this.title,
      required this.author,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    //TextStyle a = TextStyle();
    return InkWell(
      onTap: ontap,
      child: Container(
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: searchField,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: textGold,
                    ),
                  ),

                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
              child: Text(
                time,
                style: styleWB12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
              child: Text(
                title,
                style: styleWB20,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: textBlue,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      author,
                      style: styleWB12,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
