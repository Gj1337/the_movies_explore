import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/presentation/feature/bookmarks_screen/widget/bookmarks_widget.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: BookmarksWidget(),
    );
  }
}
