import 'package:drift/drift.dart';
import 'package:the_movies_expore/src/data/datasource/database/entity/movies_group.dart';
import 'package:the_movies_expore/src/data/datasource/database/entity/movies_table.dart';

class MovieGroupsTable extends Table {
  IntColumn get movieId =>
      integer().references(MoviesTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get group => intEnum<MoviesGroup>()();

  @override
  Set<Column> get primaryKey => {movieId, group};
}
