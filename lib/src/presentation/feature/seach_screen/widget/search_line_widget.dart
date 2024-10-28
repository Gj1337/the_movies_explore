import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_movies_expore/src/presentation/common/app_icons.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
import 'package:the_movies_expore/src/presentation/utils/localization_extension.dart';

class SearchLineWidget extends StatelessWidget {
  const SearchLineWidget({
    super.key,
    this.onTextChanged,
  });

  final void Function(String text)? onTextChanged;

  @override
  Widget build(BuildContext context) => TextField(
        autofocus: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF2b2b2b),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: context.localizations.search,
          hintStyle: AppFonts.serchTextStyle,
          prefixIcon: Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              AppIcons.searchDeafultImage,
            ),
          ),
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: onTextChanged?.call,
      );
}
