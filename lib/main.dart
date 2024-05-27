import 'package:flutter/material.dart';

import 'screens/main_category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Application Course',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // import main Category screen
      home: const MainCategoryScreen(),
    );
  }
}
