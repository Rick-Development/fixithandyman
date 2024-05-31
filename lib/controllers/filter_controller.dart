import 'package:flutter/material.dart';

class FilterController with ChangeNotifier {
  String _selectedCategory = 'All';

  String get selectedCategory => _selectedCategory;

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // Add methods to fetch and filter data based on the selected category
}
