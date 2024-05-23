import 'package:flutter/material.dart';

import '../constant/color_palate.dart';
import '../constant/style.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        toolbarHeight: 75,
        titleSpacing: 0,
        title: const Text('About',style: styleWB24,),
        iconTheme: const IconThemeData(color: textGold),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Our App',
              style: styleWB20
            ),
            SizedBox(height: 20),
            Text(
              'This is a Wallpaper application that showcases various features and functionalities.',
              style: styleWB14,),

            SizedBox(height: 20),
            Text(
              'Version: 1.0.0',
              style: styleWB14,
            ),
            SizedBox(height: 20),
            Text(
              'Developer: Sultan Md. Alnur',
              style: styleWB14,
            ),
            SizedBox(height: 20),
            Text(
              'Email: sultanmdalnur@gmail.com',
              style: styleWB14,
            ),
            SizedBox(height: 20),
            Text(
              'Github: https://github.com/Alnur17',
              style: styleWB14,
            ),
          ],
        ),
      ),
    );
  }
}
