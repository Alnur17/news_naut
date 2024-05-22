import '../constant/color_palate.dart';
import 'package:flutter/material.dart';

class SecurityPrivacyScreen extends StatelessWidget {
  const SecurityPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        toolbarHeight: 75,
        titleSpacing: 0,
        iconTheme: const IconThemeData(color: textGold),
        title: const Text('Security & Privacy',style: styleWB24,),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Security & Privacy Information',
              style: styleWB20
            ),
            SizedBox(height: 20),
            Text(
              'This app takes security and privacy seriously. Below are some key points:',
              style: styleWB14,
            ),
            SizedBox(height: 20),
            Text(
              '- We use encryption to secure your data during transmission.',
              style: styleWB14,
            ),
            SizedBox(height: 10),
            Text(
              '- We do not store sensitive user information on our servers.',
              style: styleWB14,
            ),
            SizedBox(height: 10),
            Text(
              '- We adhere to industry-standard security practices to protect your information.',
              style: styleWB14,
            ),
            SizedBox(height: 10),
            Text(
              '- Your privacy is important to us. We do not sell your data to third parties.',
              style: styleWB14,
            ),
            SizedBox(height: 10),
            Text(
              '- We regularly update our app to address security vulnerabilities and enhance privacy features.',
              style: styleWB14,
            ),
          ],
        ),
      ),
    );
  }
}