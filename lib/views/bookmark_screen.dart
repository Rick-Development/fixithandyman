import 'package:fixithandyman/controllers/bookmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmarks')),
      body: Consumer<BookmarkController>(
        builder: (context, bookmarkController, child) {
          return ListView.builder(
            itemCount: bookmarkController.bookmarkedArticles.length,
            itemBuilder: (context, index) {
              final article = bookmarkController.bookmarkedArticles[index];
              return ListTile(
                title: Text(article.title),
                subtitle: Text(article.content),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    bookmarkController.removeBookmark(article);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
