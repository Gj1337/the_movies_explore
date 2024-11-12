import 'dart:convert';
import 'dart:io';
import 'package:mocktail/mocktail.dart';
import 'package:the_movies_expore/src/data/datasource/network_data_source.dart';
import 'package:the_movies_expore/src/data/entity/network_responce/genres_response.dart';
import 'package:the_movies_expore/src/data/entity/network_responce/pagination_list_movie_responce.dart';

class MockNetworkDataSource extends Mock implements NetworkDataSource {
  MockNetworkDataSource() {
    when(
      () => getTopRatedMovies(
        language: any(named: 'language'),
        page: any(named: 'page'),
        region: any(named: 'region'),
      ),
    ).thenAnswer(
      (invocation) async => _getPaginationMovieListResponseFromJsonFile(
        'test/mock_data_source/mock_data/mock_top_movies.json',
        invocation.namedArguments[const Symbol('page')] as int,
      ),
    );

    when(
      () => discoverMovies(
        language: any(named: 'language'),
        page: any(named: 'page'),
        primaryReleaseDate: any(named: 'primaryReleaseDate'),
        includeAdult: any(named: 'includeAdult'),
        includeVideo: any(named: 'includeVideo'),
      ),
    ).thenAnswer(
      (invocation) async => _getPaginationMovieListResponseFromJsonFile(
        'test/mock_data_source/mock_data/mock_popular_movies.json',
        invocation.namedArguments[const Symbol('page')] as int,
      ),
    );

    when(() => getGanres(language: any(named: 'language')))
        .thenAnswer((_) async => _getGenresFromJsonFile());
  }

  Future<PaginationMovieListResponse>
      _getPaginationMovieListResponseFromJsonFile(String file, int page) async {
    final rawJson = await File(file).readAsString();
    final json = jsonDecode(rawJson) as List;

    print('🟢 $json');

    return PaginationMovieListResponse.fromJson(json[page - 1]);
  }

  Future<GenresResponse> _getGenresFromJsonFile() async {
    final currentDirectory = Directory.current.path;
    final rawJson = await File(
      '$currentDirectory/test/mock_data_source/mock_data/mock_genres.json',
    ).readAsString();
    final json = jsonDecode(rawJson) as Map<String, dynamic>;

    return GenresResponse.fromJson(json);
  }
}
