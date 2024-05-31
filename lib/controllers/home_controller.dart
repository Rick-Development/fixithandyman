import '../model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController with ChangeNotifier {
  List<Article> _articles = [];

  List<Article> get articles => _articles;

  Future<void> fetchArticles() async {
    final response = await http.get(Uri.parse('https://yourapi.com/articles'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _articles = data.map((item) => Article.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
