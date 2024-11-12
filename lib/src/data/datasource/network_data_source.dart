import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/entity/network_detailed_movie.dart';
import 'package:the_movies_expore/src/data/entity/network_responce/genres_response.dart';
import 'package:the_movies_expore/src/data/entity/network_responce/pagination_list_movie_responce.dart';
import 'package:retrofit/retrofit.dart';

part 'network_data_source.g.dart';

@Singleton(env: [Environment.dev, Environment.prod])
@RestApi()
abstract class NetworkDataSource {
  @factoryMethod
  factory NetworkDataSource(Dio dio) = _NetworkDataSource;

  @GET('/movie/top_rated')
  Future<PaginationMovieListResponse> getTopRatedMovies({
    @Query('language') required String language,
    @Query('page') required int page,
    @Query('region') String? region,
  });

  @GET('/movie/popular')
  Future<PaginationMovieListResponse> getPopularMovies({
    @Query('language') required String language,
    @Query('page') required int page,
    @Query('region') String? region,
  });

  @GET('/search/movie')
  Future<PaginationMovieListResponse> searchMovie({
    @Query('query') required String query,
    @Query('language') required String language,
    @Query('page') required int page,
    @Query('include_adult') bool includeAdult = false,
  });

  @GET('/discover/movie')
  Future<PaginationMovieListResponse> discoverMovies({
    @Query('language') required String language,
    @Query('page') required int page,
    @Query('primary_release_date.lte') required String primaryReleaseDate,
    @Query('include_adult') bool includeAdult = false,
    @Query('include_video') bool includeVideo = false,
  });

  @GET('/genre/movie/list')
  Future<GenresResponse> getGanres({
    @Query('language') required String language,
  });

  @GET('/movie/{id}')
  Future<NetworkDetailedMovie> getDetailsMovie(@Path('id') id);
}
