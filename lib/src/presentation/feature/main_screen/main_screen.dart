import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_expore/src/di/di_provider.dart';
import 'package:the_movies_expore/src/presentation/feature/main_screen/cubit/main_screen_cubit.dart';
import 'package:the_movies_expore/src/presentation/feature/main_screen/widget/main_screen_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final language = Localizations.localeOf(context).languageCode;
    final mainScreenCubit = context.getIt.get<MainScreenCubit>()
      ..onCreate(language);

    return Scaffold(
      body: BlocProvider<MainScreenCubit>(
        create: (_) => mainScreenCubit,
        child: const SafeArea(child: MainScreenWidget()),
      ),
    );
  }
}
