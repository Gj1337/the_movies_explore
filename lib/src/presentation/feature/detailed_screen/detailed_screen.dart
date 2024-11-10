import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movies_expore/src/di/di_provider.dart';
import 'package:the_movies_expore/src/presentation/feature/detailed_screen/cubit/detailed_screen_cubit.dart';
import 'package:the_movies_expore/src/presentation/feature/detailed_screen/widget/detailed_screen_widget.dart';
import 'package:the_movies_expore/src/presentation/feature/main_screen/widget/something_went_wrong_banner.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({
    this.movieId,
    super.key,
  });

  final int? movieId;

  @override
  Widget build(BuildContext context) {
    final getIt = context.getIt;
    final movieId = this.movieId;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: (movieId == null)
            ? Center(child: SomethingWentWrongBanner())
            : BlocProvider<DetailedScreenCubit>(
                create: (context) {
                  final cubit = getIt.get<DetailedScreenCubit>();
                  cubit.onCreate(movieId);

                  return cubit;
                },
                child: DetailedScreenWidget(),
              ),
      ),
    );
  }
}
