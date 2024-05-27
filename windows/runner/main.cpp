import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
        Widget build(BuildContext context) {
return MaterialApp(
        title: 'Flutter Demo',
theme: ThemeData(
        primarySwatch: Colors.blue,
),
home: MainCategoryScreen(),
);
}
}

class MainCategoryScreen extends StatefulWidget {
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

Future<void> fetchCategories() async {
final response =
        await http.get(Uri.parse('https://api.example.com/categories'));
if (response.statusCode == 200) {
setState(() {
categories = json.decode(response.body);
});
} else {
throw Exception('Failed to load categories');
}
}

@override
        Widget build(BuildContext context) {
return Scaffold(
        appBar: AppBar(
        title: Text('Main Categories'),
),
body: categories.isEmpty
? Center(child: CircularProgressIndicator())
: ListView.builder(
        itemCount: categories.length,
itemBuilder: (context, index) {
return ListTile(
        title: Text(categories[index]['name']),
        onTap: () {
Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) =>
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

class SubCategoryScreen extends StatelessWidget {
final dynamic category;

SubCategoryScreen({required this.category});

@override
        Widget build(BuildContext context) {
return Scaffold(
        appBar: AppBar(
        title: Text(category['name']),
),
body: Center(
        child: Text('Details for ${category['name']}'),
),
);
}
}
