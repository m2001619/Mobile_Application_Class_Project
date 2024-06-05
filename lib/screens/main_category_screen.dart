import 'package:flutter/material.dart';
import 'package:mobile_application_class/Providers/category_provider.dart';
import 'package:mobile_application_class/screens/sub_category_screen.dart';
import 'package:provider/provider.dart';

class MainCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) {
          if (categoryProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: categoryProvider.categories.length,
            itemBuilder: (context, index) {
              final category = categoryProvider.categories[index];
              return ListTile(
                leading: Hero(
                  tag: category.idCategory,
                  child: Image.network(category.strCategoryThumb, width: 50),
                ),
                title: Text(category.strCategory),
                subtitle: Text(category.strCategoryDescription),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SubCategoryScreen(category: category),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
