import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movies_expore/src/di/di_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:the_movies_expore/src/presentation/theme/theme.dart';

class WidgetTestWrapper extends StatelessWidget {
  const WidgetTestWrapper({
    required this.child,
    required this.getIt,
    super.key,
  });

  final GetIt getIt;
  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(
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
        theme: theme,
        home: DiProvider(
          getIt: getIt,
          child: child,
        ),
      );
}
