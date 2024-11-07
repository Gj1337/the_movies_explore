part of "../movies_app.dart";

typedef RouteInfo = ({String name, String path});

abstract final class Routes {
  static const RouteInfo mainScreen = (
    path: '/main',
    name: 'main',
  );
  static const RouteInfo detailedScreen = (
    path: '/detailed/:movieId',
    name: 'detailed',
  );
  static const RouteInfo searchScreen = (
    path: '/search',
    name: 'search',
  );
  static const RouteInfo bookmarksScreen = (
    path: '/bookmarks',
    name: 'bookmarks',
  );
}

final _router = GoRouter(
  initialLocation: Routes.mainScreen.path,
  routes: [
    GoRoute(
      path: Routes.detailedScreen.path,
      name: Routes.detailedScreen.name,
      builder: (_, state) {
        final movieIdParameter = state.pathParameters['movieId'];

        return DetailedScreen(movieId: int.tryParse(movieIdParameter ?? ''));
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (_, __, child) => BottomNavigationBarWrapper(child: child),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.mainScreen.path,
              name: Routes.mainScreen.name,
              builder: (_, ___) => const MainScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.searchScreen.path,
              name: Routes.searchScreen.name,
              builder: (_, ___) => const SeachScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
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
