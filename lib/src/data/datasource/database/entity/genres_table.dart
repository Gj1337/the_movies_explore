import 'package:drift/drift.dart';

@DataClassName('DatabaseGenre')
class GenresTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}
