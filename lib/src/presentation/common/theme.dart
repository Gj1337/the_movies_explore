import 'package:flutter/material.dart';

part 'app_fonts.dart';

const defaultHorizontalPadding = 16.0;
const defaultVerticalPadding = 20.0;

const _mainColor = Color(0xFFFFC700);
const _backgroundColor = Color(0xFF111111);
const _surfaceColor = Color(0xFF424242);
const _navigationAppBarColor = Color(0xFF0B0B0B);

final theme = ThemeData.dark().copyWith(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: _mainColor,
  ),
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
    iconTheme: IconThemeData(color: _mainColor),
  ),
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
