import 'package:flutter/material.dart';
import 'package:mobile_application_class/Providers/category_provider.dart';
import 'package:mobile_application_class/screens/main_category_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CategoryProvider()..fetchCategories(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Categories',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainCategoryScreen(),
    );
  }
}
