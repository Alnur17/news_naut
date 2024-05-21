import 'package:flutter/material.dart';
import '../constant/color_palate.dart';

void bottomSheets(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: textGold,
    context: context,
    builder: (context) {
      return  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              'data',
              style: styleWB20,
            ),
          ),
        ],
      );
    },

  );
}
