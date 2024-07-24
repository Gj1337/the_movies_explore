import 'package:drift/drift.dart';
import 'package:the_movies_expore/src/data/datasource/database/entity/genres_table.dart';
import 'package:the_movies_expore/src/data/datasource/database/entity/movies_table.dart';

class MovieGenresTable extends Table {
  IntColumn get movieId =>
      integer().references(MoviesTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get genreId =>
      integer().references(GenresTable, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {movieId, genreId};
}
