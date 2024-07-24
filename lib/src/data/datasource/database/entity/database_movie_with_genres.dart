import 'package:the_movies_expore/src/data/datasource/database/database.dart';

final class DatabaseMovieWithGenres {
  DatabaseMovieWithGenres(
    this.databaseMovie,
    this.databaseGanres,
  );

  final DatabaseMovie databaseMovie;
  final List<DatabaseGenre> databaseGanres;
}
