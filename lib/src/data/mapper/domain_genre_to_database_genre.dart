import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/datasource/database/database.dart';
import 'package:the_movies_expore/src/domain/entity/genre.dart';

@injectable
final class DomainGenreToDatabaseGenre {
  DatabaseGenre call(Genre gerne) => DatabaseGenre(
        id: gerne.id,
        name: gerne.name,
      );
}
