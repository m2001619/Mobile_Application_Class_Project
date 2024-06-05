import 'package:flutter/material.dart';
import 'package:mobile_application_class/Models/category_model.dart';
import 'package:mobile_application_class/Utils/fetcher.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _categories = [];
  bool _isLoading = false;

  List<Category> get categories => _categories;

  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();
    try {
      _categories = await ApiService().fetchCategories();
    } catch (error) {
      // Handle error
    }
    _isLoading = false;
    notifyListeners();
  }
}
