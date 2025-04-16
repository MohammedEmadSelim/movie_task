import 'package:bloc/bloc.dart';
import 'package:egb_task/core/service_locator/injector.dart';
import 'package:egb_task/features/details_screen/domain/entities/details_entity.dart';
import 'package:egb_task/features/details_screen/domain/use_cases/get_moovie_details_use_case.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
  final GetMovieDetailsUseCase getMovieDetailsUseCase =
      sl.get<GetMovieDetailsUseCase>();

  Future<void> getMovieDetails(int movieId) async {
    emit(DetailsLoading());
    final result = await getMovieDetailsUseCase.call(movieId);
    result.fold((failure) => emit(DetailsFailure(message: failure.message)),
        (movieDetails) => emit(DetailsSuccess(movieDetails: movieDetails)));
  }
}
