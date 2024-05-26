import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color_palate.dart';
import '../data/dummy_data.dart';
import '../widgets/bottom_sheet_item.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: IconButton(
                padding: const EdgeInsets.all(12),
                onPressed: () {
                  Get.back();
                },
                style: IconButton.styleFrom(
                  foregroundColor: textGold,
                  backgroundColor: containerColor,
                ),
                icon: const Icon(
                  Icons.close,
                  size: 28,
                ),
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: items.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Add padding for the first item
                  return Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: BottomSheetItem(
                      title: items[index].title,
                      subTitle: items[index].subtitle,
                      image: items[index].image,
                    ),
                  );
                } else if (index < items.length) {
                  // Render other items normally
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 12, left: 12, right: 12),
                    child: BottomSheetItem(
                      title: items[index].title,
                      subTitle: items[index].subtitle,
                      image: items[index].image,
                    ),
                  );
                } else {
                  return const SizedBox(height: 12.0);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
