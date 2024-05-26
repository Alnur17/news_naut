import 'package:flutter/material.dart';
import 'package:news_naut/screens/bottom_sheet_screen.dart';
import '../constant/color_palate.dart';

void bottomSheets(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: textGold,
       isScrollControlled: true,
       useSafeArea: true,
      context: context,
      builder: (context) => const BottomSheetScreen());
}
