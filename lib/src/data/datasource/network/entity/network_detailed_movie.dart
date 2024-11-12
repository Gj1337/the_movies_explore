import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movies_expore/src/data/datasource/network/entity/network_genre.dart';
import 'package:the_movies_expore/src/data/datasource/network/entity/network_movies_collection.dart';
import 'package:the_movies_expore/src/data/datasource/network/entity/network_production_company.dart';
import 'package:the_movies_expore/src/data/datasource/network/entity/network_production_country.dart';
import 'package:the_movies_expore/src/data/datasource/network/entity/network_spoken_language.dart';

part 'network_detailed_movie.freezed.dart';
part 'network_detailed_movie.g.dart';

@freezed
class NetworkDetailedMovie with _$NetworkDetailedMovie {
  const factory NetworkDetailedMovie({
    required int id,
    required String title,
    required String overview,
    required int runtime,
    required String tagline,
    required bool video,
    required String status,
    required int budget,
    required int revenue,
    required int popularity,
    @JsonKey(name: 'vote_average') required double vote,
    @JsonKey(name: 'vote_count') required int voteCount,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'genres') required List<NetworkGenre> genres,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    //
    @Default([])
    @JsonKey(name: 'production_companies')
    List<NetworkProductionCompany> productionCompanies,
    //
    @Default([])
    @JsonKey(name: 'production_countries')
    List<NetworkProductionCountry> productionCountries,
    //
    @Default([])
    @JsonKey(name: 'spoken_languages')
    List<NetworkSpokenLanguage> spokenLanguages,
    //
    //
    @Default([]) @JsonKey(name: 'origin_country') List<String> originCountries,
    //
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'belongs_to_collection') NetworkMoviesCollection? collection,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    String? homepage,
  }) = _NetworkDetailedMovie;

  factory NetworkDetailedMovie.fromJson(Map<String, dynamic> json) =>
      _$NetworkDetailedMovieFromJson(json);
}
