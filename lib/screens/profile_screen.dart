import 'package:flutter/material.dart';
import 'package:news_naut/constant/color_palate.dart';

import '../constant/style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          'Profile',
          style: styleWB24,
        ),
        iconTheme: const IconThemeData(color: textGold),
      ),
    );
  }
}
