import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant/color_palate.dart';

class NewsTile extends StatelessWidget {
  final String image;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;

  const NewsTile(
      {super.key,
      required this.image,
      required this.time,
      required this.title,
      required this.author,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: styleWB20,
                    maxLines: 2,
                    //overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    time,
                    style: const TextStyle(color: searchFieldText),
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: textBlue,
                        radius: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        author,
                        style: styleWB12,
                      ),
                    ],
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
