import 'package:drift/drift.dart';

@DataClassName('DatabaseMovie')
class MoviesTable extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get overview => text()();
  RealColumn get vote => real()();
  TextColumn get webUrl => text()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get backdropPath => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
