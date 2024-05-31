import 'package:fixithandyman/model/article_model.dart';
import 'package:flutter/material.dart';

class BookmarkController with ChangeNotifier {
  List<Article> _bookmarkedArticles = [];

  List<Article> get bookmarkedArticles => _bookmarkedArticles;

  void addBookmark(Article article) {
    _bookmarkedArticles.add(article);
    notifyListeners();
  }

  void removeBookmark(Article article) {
    _bookmarkedArticles.remove(article);
    notifyListeners();
  }
}
