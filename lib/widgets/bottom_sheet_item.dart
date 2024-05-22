import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_naut/screens/profile_screen.dart';

import '../constant/color_palate.dart';
import '../screens/about_screen.dart';
import '../screens/security_&_privacy_screen.dart';

class BottomSheetItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const BottomSheetItem(
      {required this.title,
      required this.subTitle,
      required this.image,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'Profile') {
          Get.to(()=> const ProfileScreen());
        } else if (title == 'About') {
          Get.to(()=> const AboutScreen());
        }else if (title == 'Security') {
          Get.to(()=> const SecurityPrivacyScreen());
        }
      },
      child: Container(
        //margin: const EdgeInsets.only( right: 16, left: 16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: containerColor,
        ),

        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: styleWB20,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subTitle,
                    style: styleWB14,
                  ),
                ],
              ),
            ),
            Image.asset(image,color: textBlue,),
          ],
        ),
      ),
    );
  }
}
