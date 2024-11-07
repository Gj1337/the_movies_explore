import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_expore/src/di/di_provider.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/cubit/search_screen_cubit.dart';
import 'package:the_movies_expore/src/presentation/feature/seach_screen/widget/search_screen_widget.dart';

class SeachScreen extends StatelessWidget {
  const SeachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = context.getIt;

    return SafeArea(
      child: BlocProvider<SearchSreenCubit>(
        create: (_) {
          final searchCubit = getIt.get<SearchSreenCubit>();

          return searchCubit;
        },
        child: const SearchScreenWidget(),
      ),
    );
  }
}
