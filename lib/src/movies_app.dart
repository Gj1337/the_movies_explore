import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:the_movies_expore/src/di/dependency_injection.config.dart';
import 'package:the_movies_expore/src/di/di_provider.dart';
import 'package:the_movies_expore/src/domain/entity/movie.dart';
import 'package:the_movies_expore/src/presentation/common/bookmarks_cubit/bookmarks_cubit.dart';
import 'package:the_movies_expore/src/presentation/common/bottom_navigation_bar_wrapper.dart';
import 'package:the_movies_expore/src/presentation/common/theme.dart';
import 'package:the_movies_expore/src/presentation/feature/bookmarks_screen/bookmarks_screen.dart';
import 'package:the_movies_expore/src/presentation/feature/detailed_screen/detailed_screen.dart';
import 'package:the_movies_expore/src/presentation/feature/main_screen/main_screen.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/seach_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'presentation/routes.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) => DiProvider(
        getIt: GetIt.instance,
        setupGetIt: _setUpDi,
        child: MaterialApp.router(
          builder: (context, child) {
            final bookmarksCubit = context.getIt.get<BookmarksCubit>()
              ..onCreate();

            return BlocProvider<BookmarksCubit>(
              lazy: false,
              create: (_) => bookmarksCubit,
              child: child,
            );
          },
          routerConfig: _router,
          theme: theme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('uk', ''),
          ],
        ),
      );
}

Future<void> _setUpDi(GetIt getIt) async {
  await init(getIt);

  FlutterNativeSplash.remove();
}
