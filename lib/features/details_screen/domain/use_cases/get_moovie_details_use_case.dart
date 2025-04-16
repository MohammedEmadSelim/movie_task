import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/core/usecase/usecase.dart';
import 'package:egb_task/features/details_screen/domain/entities/details_entity.dart';
import 'package:egb_task/features/details_screen/domain/repository/base_details_screen_repositpory.dart';
import 'package:either_dart/src/either.dart';

class GetMovieDetailsUseCase extends UseCaseWithParam<MovieDetailsEntity, int> {
  final BaseDetailsScreenRepository baseDetailsScreenRepository;

  GetMovieDetailsUseCase(this.baseDetailsScreenRepository);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(int parameters) {
    return baseDetailsScreenRepository.getMovieDetails(parameters);
  }
}
