import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_movies_expore/src/data/datasource/database/database.dart';
import 'package:the_movies_expore/src/data/datasource/database/database_data_source.dart';
import 'package:the_movies_expore/src/data/datasource/local_storage_source.dart';
import 'package:the_movies_expore/src/data/datasource/network/network_data_source.dart';
import 'package:the_movies_expore/src/data/mapper/database_genre_to_domain_genre.dart';
import 'package:the_movies_expore/src/data/mapper/database_movie_with_genres_to_domain_movie.dart';
import 'package:the_movies_expore/src/data/mapper/domain_genre_to_database_genre.dart';
import 'package:the_movies_expore/src/data/mapper/domain_movie_to_database_movie.dart';
import 'package:the_movies_expore/src/data/mapper/domain_movie_to_network_movie.dart';
import 'package:the_movies_expore/src/data/mapper/network_detailed_movie_to_domain_detailed_movie.dart';
import 'package:the_movies_expore/src/data/mapper/network_genre_to_domain_genre.dart';
import 'package:the_movies_expore/src/data/mapper/network_movie_to_domain_movie.dart';
import 'package:the_movies_expore/src/data/mapper/network_movies_collection_to_domain_movies_collection.dart';
import 'package:the_movies_expore/src/data/mapper/network_spoken_language_to_domain_spoken_language.dart';
import 'package:the_movies_expore/src/data/mapper/newtork_production_company_to_domain_production_company.dart';
import 'package:the_movies_expore/src/data/mapper/newtork_production_country_to_domain_production_country.dart';
import 'package:the_movies_expore/src/data/mapper/pagination_list_movie_responce_to_domain_movies_page.dart';
import 'package:the_movies_expore/src/data/repository/movie_repository_impl.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/domain/repository/movie_repository.dart';

import '../utils/test_logger.dart';

const _compliterTimeoutDuration = Duration(seconds: 1);

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  final movieRepository = await getMovieRepository();

  const mockMovie = Movie(
    id: 12345,
    title: 'Mock movie',
    overview: 'Mock movie overview',
    vote: 8.1,
    genres: [],
    webUrl: '',
  );

  group('Bookmarks test ->', () {
    test('Bookmark movie', () async {
      final completer = Completer<void>();

      final bookmarkedMoviesListener =
          movieRepository.bookmarkMoviesStream().listen((moviePage) {
        expect(moviePage.movies, contains(mockMovie));

        completer.complete();
      });

      try {
        await movieRepository.bookmakrMovie(mockMovie);
        await completer.future.timeout(_compliterTimeoutDuration);
      } finally {
        await bookmarkedMoviesListener.cancel();
      }

      TestLogger.printDone();
    });

    test(
      'UndoBookmark movie',
      () async {
        await movieRepository.bookmakrMovie(mockMovie);

        final completer = Completer<void>();

        final bookmarkedMoviesListener =
            movieRepository.bookmarkMoviesStream().listen((moviePage) {
          expect(moviePage.movies, isNot(contains(mockMovie)));

          completer.complete();
        });

        try {
          await movieRepository.undoBookmarMovie(mockMovie);
          await completer.future.timeout(_compliterTimeoutDuration);
        } finally {
          await bookmarkedMoviesListener.cancel();
        }

        TestLogger.printDone();
      },
    );
  });
}

//TODO: replace with getting entity from DI.
Future<MovieRepository> getMovieRepository() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final movieRepository = MovieRepositoryImpl(
    NetworkDataSource(Dio()),
    PaginationListMovieResponceToDomainMoviesPage(
      NetworkGenreToDomainGenre(),
      NetworkMovieToDomainMovie(),
    ),
    DatabaseDataSource(AppDatabase.test()),
    DomainMovieToNetworkMovie(),
    NetworkDetailedMovieToDomainDetailedMovie(
      NetworkGenreToDomainGenre(),
      NetworkMoviesCollectionToDomainMoviesCollection(),
      NetworkProductionCompanyToDomainProductionCompany(),
      NetworkSpokenLanguageToDomainSpokenLanguage(),
      NetworkProductionCountryToDomainProductionCountry(),
    ),
    LocalStorageSource(sharedPreferences),
    DomainMovieToDatabaseMovie(),
    DomainGenreToDatabaseGenre(),
    DatabaseMovieWithGanresToDomainMovie(
      DatabaseGenreToDomainGenre(),
    ),
  );

  return movieRepository;
}
