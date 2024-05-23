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
        titleSpacing: 0,
        title: const Text(
          'Profile',
          style: styleWB24,
        ),
        iconTheme: const IconThemeData(color: textGold,size: 26),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: Sultan Md. Alnur',style: styleWB14),
            Text('Address: Laxmipur, Rajshahi, Bangladesh',style: styleWB14),
          ],
        ),
      ),
    );
  }
}
