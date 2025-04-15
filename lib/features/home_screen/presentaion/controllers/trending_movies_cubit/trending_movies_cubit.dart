import 'package:bloc/bloc.dart';
import 'package:egb_task/core/service_locator/injector.dart';
import 'package:egb_task/features/home_screen/domain/entities/trending_all_entity.dart';
import 'package:egb_task/features/home_screen/domain/use_cases/get_trending_all_use_cases.dart';
import 'package:meta/meta.dart';

part 'trending_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit() : super(TrendingMoviesInitial());
  final GetTrendingAllUseCases getTrendingAllUseCases =
      sl.get<GetTrendingAllUseCases>();

  Future<void> getTrendingMovies() async {
    emit(TrendingMoviesLoading());
    final result = await getTrendingAllUseCases.call();
    result.fold(
        (failure) => emit(TrendingMoviesFailure(message: failure.message)),
        (movies) => emit(TrendingMoviesSuccess(movies: movies)));
  }
}
