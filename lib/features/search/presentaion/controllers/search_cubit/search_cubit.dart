import 'package:bloc/bloc.dart';
import 'package:egb_task/core/service_locator/injector.dart';
import 'package:egb_task/features/search/domain/entities/search_enitty.dart';
import 'package:egb_task/features/search/domain/use_cases/search_use_case.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  final SearchUseCase searchUseCase = sl.get<SearchUseCase>();

  Future<void> search(String parameters) async {
    emit(SearchLoading());
    final result = await searchUseCase.call(parameters);
    result.fold((failure) {
      emit(SearchFailure(message: failure.message));
    }, (data) {
      emit(SearchSuccess(movies: data.results));
    });
  }
}
