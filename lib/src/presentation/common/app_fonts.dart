part of 'theme.dart';

abstract final class AppFonts {
  static const _poppins = 'Poppins';

  static final bigHeaderTextStyle = TextStyle(
    fontFamily: _poppins,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final movieNameBroadCardTextStyle = TextStyle(
    fontFamily: _poppins,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final wideMovieRateNumberTextStyle = TextStyle(
    fontFamily: _poppins,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static final genreMovieTextStyle = TextStyle(
    fontFamily: _poppins,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final overviewMovieOnCardTextStyle = TextStyle(
    fontFamily: _poppins,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF888888),
  );

  static final overviewMovieTextStyle = TextStyle(
    fontFamily: _poppins,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF888888),
  );

  static final serchTextStyle = TextStyle(
    fontFamily: _poppins,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final linkTextStyle = TextStyle(
    fontFamily: _poppins,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: _mainColor,
  );
}
