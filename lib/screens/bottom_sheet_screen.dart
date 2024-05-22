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
      appBar: AppBar(
        backgroundColor: background,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.close),
        ),
        iconTheme: const IconThemeData(color: textGold),
      ),
      body: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            // Add padding for the first item
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: BottomSheetItem(
                title: items[index].title,
                subTitle: items[index].subtitle,
                image: items[index].image,
              ),
            );
          } else if (index < items.length) {
            // Render other items normally
            return Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: BottomSheetItem(
                title: items[index].title,
                subTitle: items[index].subtitle,
                image: items[index].image,
              ),
            );
          } else {
            return const SizedBox(height: 16.0);
          }
        },
      ),
    );
  }
}
