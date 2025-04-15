import 'package:bloc/bloc.dart';
import 'package:egb_task/core/service_locator/injector.dart';
import 'package:egb_task/features/home_screen/domain/entities/most_popular_entity.dart';
import 'package:egb_task/features/home_screen/domain/use_cases/get_most_popular_use_case.dart';
import 'package:meta/meta.dart';

part 'most_popular_state.dart';

class MostPopularCubit extends Cubit<MostPopularState> {
  MostPopularCubit() : super(MostPopularInitial());
  final GetMostPopularUseCase getMostPopularUseCase =
      sl.get<GetMostPopularUseCase>();

  Future<void> getMostPopular() async {
    emit(MostPopularLoading());
    final result = await getMostPopularUseCase.call();
    result.fold((l) => emit(MostPopularFailure(message: l.message)),
        (r) => emit(MostPopularSuccess( movies: r.results)));
  }
}
