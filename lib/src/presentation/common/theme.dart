import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const defaultHorizontalPadding = 16.0;
const defaultVerticalPadding = 20.0;

const _mainColor = Color(0xFFFFC700);
const _backgroundColor = Color(0xFF111111);
const _surfaceColor = Color(0xFF424242);
const _navigationAppBarColor = Color(0xFF0B0B0B);

final theme = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark().copyWith(
    primary: _mainColor,
    surface: _surfaceColor,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    height: 70,
  ),
  appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 90,
      centerTitle: false,
      backgroundColor: _backgroundColor,
      iconTheme: IconThemeData(color: _mainColor)),
  scaffoldBackgroundColor: _backgroundColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: _navigationAppBarColor,
  ),
  cardTheme: CardTheme(
    elevation: 0,
    margin: EdgeInsets.zero,
    clipBehavior: Clip.hardEdge,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
);

const homeActiveImage = 'assets/image/home_active.svg';
const homeDefaultImage = 'assets/image/home_default.svg';
const searchActiveImage = 'assets/image/search_icon_acitve.svg';
const searchDeafultImage = 'assets/image/search_icon_default.svg';
const bookmarkActiveImage = 'assets/image/bookmark_icon_active.svg';
const bookMarkDefaultImage = 'assets/image/bookmark_icon_default.svg';
const starIconFull = 'assets/image/star_icon_full.svg';
const starIconHalf = 'assets/image/star_icon_half.svg';
const starIconEmpty = 'assets/image/star_icon_empty.svg';

//TODO: put style to TextTheme
final bigHeaderTextStyle = GoogleFonts.poppins(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

final movieNameBroadCardTextStyle = GoogleFonts.poppins(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

final wideMovieRateNumberTextStyle = GoogleFonts.poppins(
  fontSize: 22,
  fontWeight: FontWeight.w500,
);

final genreMovieTextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

final overviewMovieOnCardTextStyle = GoogleFonts.poppins(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  color: const Color(0xFF888888),
);

final overviewMovieTextStyle = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: const Color(0xFF888888),
);

final serchTextStyle = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);
