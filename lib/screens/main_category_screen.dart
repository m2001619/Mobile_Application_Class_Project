import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'sub_category_screen.dart';

class MainCategoryScreen extends StatefulWidget {
  const MainCategoryScreen({super.key});

  @override
  _MainCategoryScreenState createState() => _MainCategoryScreenState();
}

class _MainCategoryScreenState extends State<MainCategoryScreen> {
  List<dynamic> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  // Fetch data from Api
  Future<void> fetchCategories() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      setState(() {
        categories = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // Create the component of the screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Categories'),
      ),
      body: categories.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categories[index]['title']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            // call sub category screen and pass data as props
                            SubCategoryScreen(category: categories[index]),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
