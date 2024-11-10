import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_movies_expore/src/domain/repository/movie_repository.dart';
import 'package:the_movies_expore/src/presentation/feature/detailed_screen/cubit/detailed_screen_state.dart';
import 'package:the_movies_expore/src/presentation/utils/logger_mixin.dart';

@injectable
class DetailedScreenCubit extends Cubit<DetailedScreenState> with LoggerMixin {
  DetailedScreenCubit(this._movieRepository)
      : super(const DetailedScreenState());

  final MovieRepository _movieRepository;

  Future<void> onCreate(int movieId) async {
    logger.d('onCreate movieId=$movieId');

    emit(state.copyWith(isLoading: true));

    try {
      final detailedMovie =
          await _movieRepository.getDetailedMovie(id: movieId);

      emit(state.copyWith(detailedMovie: detailedMovie));
    } catch (exception) {
      logger.e('onCreate catch $exception');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
