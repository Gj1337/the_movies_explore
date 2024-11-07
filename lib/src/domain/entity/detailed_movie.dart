// ignore_for_file: unused_element

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_movies_expore/src/domain/entity/genre.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/domain/entity/movies_collection.dart';
import 'package:the_movies_expore/src/domain/entity/production_company.dart';
import 'package:the_movies_expore/src/domain/entity/production_country.dart';
import 'package:the_movies_expore/src/domain/entity/spoken_language.dart';

part 'detailed_movie.freezed.dart';

@freezed
class DetailedMovie with _$DetailedMovie {
  const DetailedMovie._();

  const factory DetailedMovie({
    required int id,
    required String title,
    required String overview,
    required Duration runtime,
    required String tagline,
    required bool video,
    required String status,
    required int budget,
    required int revenue,
    required int popularity,
    required double vote,
    required int voteCount,
    required DateTime releaseDate,
    required List<Genre> genres,
    required String originalLanguage,
    required String originalTitle,
    required String webUrl,
    @Default([]) List<ProductionCompany> productionCompanies,
    @Default([]) List<ProductionCountry> productionCountries,
    @Default([]) List<SpokenLanguage> spokenLanguages,
    @Default([]) List<String> originCountries,
    String? imdbId,
    MoviesCollection? collection,
    String? posterPath,
    String? backdropPath,
    String? homepage,
  }) = _DetailedMovie;

  Movie get movie => Movie(
        id: id,
        title: title,
        overview: overview,
        vote: vote,
        genres: genres,
        webUrl: webUrl,
        posterPath: posterPath,
        backdropPath: backdropPath,
      );
}
