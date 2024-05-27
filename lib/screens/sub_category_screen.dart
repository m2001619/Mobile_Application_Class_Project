import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  final dynamic category;

  const SubCategoryScreen({super.key, required this.category});

  // Handle the data of each category
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${category['title']}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Body: ${category['body']}'),
          ],
        ),
      ),
    );
  }
}
