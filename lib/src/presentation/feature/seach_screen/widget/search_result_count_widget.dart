import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
import 'package:the_movies_expore/src/presentation/utils/localization_extension.dart';

class SearchResultCount extends StatelessWidget {
  const SearchResultCount({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        context.localizations.searchResult(count),
        style: serchTextStyle,
      ),
    );
  }
}
