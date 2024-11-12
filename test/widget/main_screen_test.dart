import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_movies_expore/src/data/datasource/network_data_source.dart';
import 'package:the_movies_expore/src/di/dependency_injection.config.dart';
import 'package:the_movies_expore/src/presentation/common/movie_card/big_picture_movie_card.dart';
import 'package:the_movies_expore/src/presentation/common/movie_card/wide_movie_card.dart';
import 'package:the_movies_expore/src/presentation/common/movie_list_widget/movie_list_shimmer.dart';
import 'package:the_movies_expore/src/presentation/feature/main_screen/main_screen.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/widget/search_screen_info_banner.dart/something_went_wrong_banner.dart';

import '../mock_data_source/mock_network_data_source.dart';
import 'widget_test_wrapper.dart';

void main() {
  group(
    'Main screen test',
    () {
      final getIt = GetIt.instance;
      final mockNetworkDataSource = MockNetworkDataSource();
      final mainScreen = WidgetTestWrapper(
        getIt: getIt,
        child: MainScreen(),
      );

      setUpAll(() async {
        SharedPreferences.setMockInitialValues({});

        getIt.registerSingleton<NetworkDataSource>(mockNetworkDataSource);

        await init(
          getIt,
          environment: Environment.test,
        );
      });

      testWidgets(
        'Show shimmer while loading',
        (tester) async {
          await tester.pumpWidget(mainScreen);
          await tester.pump();

          final movieListShimmerFinder = find.byType(MovieListShimmer);
          expect(movieListShimmerFinder, findsOne);

          final carouselShimmersFinder =
              find.byType(BigPictureMovieCardShimmer);
          expect(carouselShimmersFinder, findsAny);

          final wideMovieCardFineder = find.byType(WideMovieCard);
          expect(wideMovieCardFineder, findsNothing);

          final bigMovieCardFinder = find.byType(BigPictureMovieCard);
          expect(bigMovieCardFinder, findsNothing);
        },
      );

      testWidgets('Show error banner when failed to catch movies',
          (tester) async {
        final exceptionPlacholder = Exception('Mock exception');

        when(
          () => mockNetworkDataSource.discoverMovies(
            language: 'en',
            page: any(named: 'page'),
            primaryReleaseDate: any(named: 'primaryReleaseDate'),
          ),
        ).thenThrow(exceptionPlacholder);

        //      when(
        //   () => mockNetworkDataSource.getTopRatedMovies(
        //     language: 'en',
        //     page: any(named: 'page'),
        //   ),
        // ).thenThrow(exceptionPlacholder);

        // when(
        //   () => mockNetworkDataSource.getPopularMovies(
        //     language: 'en',
        //     page: any(named: 'page'),
        //   ),
        // ).thenThrow(exceptionPlacholder);

        await tester.pumpWidget(mainScreen);
        await tester.pump();

        final somethingWentWrongBannerFinder =
            find.byType(SomethingWentWrongBanner);
        expect(somethingWentWrongBannerFinder, findsOne);

        reset(mockNetworkDataSource);
      });
    },
  );
}
