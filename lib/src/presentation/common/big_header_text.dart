import 'package:flutter/material.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';

class BigHeaderText extends StatelessWidget {
  const BigHeaderText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          text: text,
          style: AppFonts.bigHeader,
          children: [
            TextSpan(
              text: '.',
              style: AppFonts.bigHeader.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      );
}
