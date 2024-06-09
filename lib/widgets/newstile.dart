import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constant/color_palate.dart';
import '../constant/style.dart';

class NewsTile extends StatelessWidget {
  final String image;
  final DateTime time;
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
    String formattedDate = DateFormat('yyyy-MM-dd').format(time);
    return InkWell(
      splashColor: textGold,
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: containerColor,
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
                  height: double.infinity,
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 6, right: 12, top: 12, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: styleWB20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    Text(
                      formattedDate,
                      style: const TextStyle(color: searchFieldText),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: textBlue,
                          radius: 4,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
