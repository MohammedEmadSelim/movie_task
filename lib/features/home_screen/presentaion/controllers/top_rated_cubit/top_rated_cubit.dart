import 'package:bloc/bloc.dart';
import 'package:egb_task/core/service_locator/injector.dart';
import 'package:egb_task/features/home_screen/domain/entities/top_rated_entity.dart';
import 'package:egb_task/features/home_screen/domain/use_cases/get_top_rated_use_case.dart';
import 'package:meta/meta.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit() : super(TopRatedInitial());
  final GetTopRatedUseCase  getTopRatedUseCase = sl.get<GetTopRatedUseCase>();

  Future<void> getTopRated() async {
    emit(TopRatedLoading());
    final result = await getTopRatedUseCase.call();
    result.fold((l) => emit(TopRatedFailure(l.message)), (r) => emit(TopRatedSuccess(r.results)));
  }
}
