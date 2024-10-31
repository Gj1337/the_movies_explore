part of 'theme.dart';

abstract final class AppFonts {
  static const _poppins = 'Poppins';

  static final bigHeader = TextStyle(
    fontFamily: _poppins,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final movieNameBroadCard = TextStyle(
    fontFamily: _poppins,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final wideMovieRateNumber = TextStyle(
    fontFamily: _poppins,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static final genreMovie = TextStyle(
    fontFamily: _poppins,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final bannerTitle = TextStyle(
    fontFamily: _poppins,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final overviewMovieOnCard = TextStyle(
    fontFamily: _poppins,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF888888),
  );

  static final overviewMovie = TextStyle(
    fontFamily: _poppins,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF888888),
  );

  static final serch = TextStyle(
    fontFamily: _poppins,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final link = TextStyle(
    fontFamily: _poppins,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: _mainColor,
  );
}
