import 'package:bloc/bloc.dart';
import 'package:egb_task/core/service_locator/injector.dart';
import 'package:egb_task/features/home_screen/domain/entities/now_playing_entity.dart';
import 'package:egb_task/features/home_screen/domain/use_cases/get_now_playing_use_case.dart';
import 'package:meta/meta.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingInitial());
  final GetNowPlayingUseCase getNowPlayingUseCase =
      sl.get<GetNowPlayingUseCase>();

  Future<void> getNowPlaying() async {
    emit(NowPlayingLoading());
    final result = await getNowPlayingUseCase.call();
    result.fold((l) {
      emit(NowPlayingFailure(message: l.message));
    }, (r) {
      emit(NowPlayingSuccess(movies: r.results));
    });
  }
}
