import 'package:flutter/material.dart';
import 'package:news_naut/constant/color_palate.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        title: const Text(
          'News Details',
          style: TextStyle(color: justWhite),
        ),
        iconTheme: const IconThemeData(
          color: justWhite, // Change this to the color you want for the back button
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'News Headline',
                style: styleWB24,
              ),
              const SizedBox(height: 8.0),
              const Row(
                children: [
                  Text(
                    'Author: John Doe',
                    style: styleWB16,
                  ),
                  Spacer(),
                  Text(
                    'Date: 2024-05-19',
                    style: styleWB16,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://plus.unsplash.com/premium_photo-1671019820530-728527dec7e4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Quisque sit amet accumsan tortor. Sed cursus auctor nisi, '
                'id vehicula metus venenatis a. Curabitur vehicula lacus eu '
                'sapien viverra, nec tempor elit sollicitudin. Vivamus suscipit '
                'ultrices erat, a interdum urna dictum sed.',
                style: styleWB18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
