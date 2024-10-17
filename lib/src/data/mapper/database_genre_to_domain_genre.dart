import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/datasource/database/database.dart';
import 'package:the_movies_expore/src/domain/entity/genre.dart';

@injectable
final class DatabaseGenreToDomainGenre {
  Genre call(DatabaseGenre databaseGerne) => Genre(
        id: databaseGerne.id,
        name: databaseGerne.name,
      );
}
