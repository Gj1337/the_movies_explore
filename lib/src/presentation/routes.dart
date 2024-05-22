part of "../movies_app.dart";

typedef RouteInfo = ({String name, String path});

abstract final class Routes {
  static const RouteInfo mainScreen = (
    path: '/main',
    name: 'main',
  );
  static const RouteInfo detailedScreen = (
    path: 'detailed',
    name: 'detailed',
  );
  static const RouteInfo latestScreen = (
    path: 'latest',
    name: 'latest',
  );
  static const RouteInfo searchScreen = (
    path: 'search',
    name: 'search',
  );
  static const RouteInfo bookmarksScreen = (
    path: 'bookmarks',
    name: 'bookmarks',
  );
}

final _router = GoRouter(
  initialLocation: Routes.mainScreen.path,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final bookmarksCubit = context.getIt.get<BookmarksCubit>()..onCreate();

        return BottomNavigationBarWrapper(
          path: state.fullPath,
          child: BlocProvider<BookmarksCubit>(
              lazy: false, create: (_) => bookmarksCubit, child: child),
        );
      },
      routes: [
        GoRoute(
          path: Routes.mainScreen.path,
          name: Routes.mainScreen.name,
          builder: (_, ___) => const MainScreen(),
          routes: [
            GoRoute(
              path: Routes.detailedScreen.path,
              name: Routes.detailedScreen.name,
              builder: (_, state) {
                final movie = state.extra as Movie;

                return DetailedScreen(movie: movie);
              },
            ),
            GoRoute(
              path: Routes.searchScreen.path,
              name: Routes.searchScreen.name,
              builder: (_, ___) => const SeachScreen(),
            ),
            GoRoute(
              path: Routes.bookmarksScreen.path,
              name: Routes.bookmarksScreen.name,
              builder: (_, ___) => const BookmarksScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
