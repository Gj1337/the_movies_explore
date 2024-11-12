import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/datasource/database/entity/genres_table.dart';
import 'package:the_movies_expore/src/data/datasource/database/entity/movie_genres_table.dart';
import 'package:the_movies_expore/src/data/datasource/database/entity/movie_groups_table.dart';
import 'package:the_movies_expore/src/data/datasource/database/entity/movies_table.dart';
import 'package:the_movies_expore/src/data/datasource/database/entity/movies_group.dart';

part 'database.g.dart';

@singleton
@DriftDatabase(
  tables: [
    MoviesTable,
    GenresTable,
    MovieGenresTable,
    MovieGroupsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase._(super.queryExecutor);

  @factoryMethod
  factory AppDatabase.main() =>
      AppDatabase._(driftDatabase(name: 'my_database'));

  factory AppDatabase.test() => AppDatabase._(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;
}
