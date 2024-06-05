import 'package:flutter/material.dart';
import 'package:mobile_application_class/Models/category_model.dart';

class SubCategoryScreen extends StatelessWidget {
  final Category category;

  SubCategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.strCategory),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Hero(
              tag: category.idCategory,
              child: Image.network(category.strCategoryThumb),
            ),
            SizedBox(height: 16),
            Text(
              category.strCategoryDescription,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
