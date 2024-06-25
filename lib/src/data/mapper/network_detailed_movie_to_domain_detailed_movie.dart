import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/data/config.dart';
import 'package:the_movies_expore/src/data/entity/network_detailed_movie.dart';
import 'package:the_movies_expore/src/data/mapper/network_genre_to_domain_genre.dart';
import 'package:the_movies_expore/src/data/mapper/network_movies_collection_to_domain_movies_collection.dart';
import 'package:the_movies_expore/src/data/mapper/network_spoken_language_to_domain_spoken_language.dart';
import 'package:the_movies_expore/src/data/mapper/newtork_production_company_to_domain_production_company.dart';
import 'package:the_movies_expore/src/data/mapper/newtork_production_country_to_domain_production_country.dart';
import 'package:the_movies_expore/src/domain/entity/detailed_movie.dart';

@injectable
final class NetworkDetailedMovieToDomainDetailedMovie {
  NetworkDetailedMovieToDomainDetailedMovie(
    this._networkGenreToDomainGenre,
    this._networkMoviesCollectionToDomainMoviesCollection,
    this._networkProductionCompanyToDomainProductionCompany,
    this._networkSpokenLanguageToDomainSpokenLanguage,
    this._newtorkProductionCountryToDomainProductionCountiry,
  );

  final NetworkGenreToDomainGenre _networkGenreToDomainGenre;
  final NetworkMoviesCollectionToDomainMoviesCollection
      _networkMoviesCollectionToDomainMoviesCollection;
  final NetworkProductionCompanyToDomainProductionCompany
      _networkProductionCompanyToDomainProductionCompany;
  final NewtorkProductionCountryToDomainProductionCountry
      _newtorkProductionCountryToDomainProductionCountiry;
  final NetworkSpokenLanguageToDomainSpokenLanguage
      _networkSpokenLanguageToDomainSpokenLanguage;

  DetailedMovie call(
    NetworkDetailedMovie networkMovie,
  ) =>
      DetailedMovie(
        id: networkMovie.id,
        posterPath: '$imageUrl${networkMovie.posterPath}',
        backdropPath: '$imageUrl${networkMovie.backdropPath}',
        title: networkMovie.title,
        vote: networkMovie.vote / 2,
        overview: networkMovie.overview,
        webUrl: '$hostSiteUrl/movie/${networkMovie.id}',
        genres:
            networkMovie.genres.map(_networkGenreToDomainGenre.call).toList(),
        runtime: Duration(minutes: networkMovie.runtime),
        tagline: networkMovie.tagline,
        video: networkMovie.video,
        status: networkMovie.status,
        budget: networkMovie.budget,
        revenue: networkMovie.revenue,
        popularity: networkMovie.popularity,
        voteCount: networkMovie.voteCount,
        releaseDate: DateTime.parse(networkMovie.releaseDate),
        originalLanguage: networkMovie.originalLanguage,
        originalTitle: networkMovie.originalTitle,
        productionCompanies: networkMovie.productionCompanies
            .map(_networkProductionCompanyToDomainProductionCompany.call)
            .toList(),
        productionCountries: networkMovie.productionCountries
            .map(_newtorkProductionCountryToDomainProductionCountiry.call)
            .toList(),
        spokenLanguages: networkMovie.spokenLanguages
            .map(_networkSpokenLanguageToDomainSpokenLanguage.call)
            .toList(),
        collection: networkMovie.collection != null
            ? _networkMoviesCollectionToDomainMoviesCollection(
                networkMovie.collection!,
              )
            : null,
        originCountries: networkMovie.originCountries,
        imdbId: networkMovie.imdbId,
      );
}
