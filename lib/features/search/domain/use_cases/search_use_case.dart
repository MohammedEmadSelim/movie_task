import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/core/usecase/usecase.dart';
import 'package:egb_task/features/search/data/models/search_model.dart';
import 'package:egb_task/features/search/domain/repository/base_search_repository.dart';
import 'package:either_dart/src/either.dart';

class SearchUseCase extends UseCaseWithParam<SearchResponseModel, String>{
  final BaseSearchRepository baseSearchRepository;
  SearchUseCase(this.baseSearchRepository);
  @override
  Future<Either<Failure, SearchResponseModel>> call(String parameters) {
    return baseSearchRepository.search(parameters);
  }
}