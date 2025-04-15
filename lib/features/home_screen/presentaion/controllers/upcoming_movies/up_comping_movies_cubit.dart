import 'package:bloc/bloc.dart';
import 'package:egb_task/core/service_locator/injector.dart';
import 'package:egb_task/features/home_screen/domain/entities/upcoming_entity.dart';
import 'package:egb_task/features/home_screen/domain/use_cases/get_upcoming_movies.dart';
import 'package:meta/meta.dart';

part 'up_comping_movies_state.dart';

class UpCompingMoviesCubit extends Cubit<UpCompingMoviesState> {
  UpCompingMoviesCubit() : super(UpCompingMoviesInitial());
  final GetUpcomingMoviesUseCase getUpcomingMovies =
      sl.get<GetUpcomingMoviesUseCase>();

  Future<void> getUpcomingMoviesData() async {
    emit(UpCompingMoviesLoading());
    final result = await getUpcomingMovies.call();
    result.fold((l) => emit(UpCompingMoviesFailure(message: l.message)),
        (r) => emit(UpCompingMoviesSuccess(movies: r.results)));
  }
}
