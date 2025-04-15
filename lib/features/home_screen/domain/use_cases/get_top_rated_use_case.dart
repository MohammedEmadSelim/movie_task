import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/core/usecase/usecase.dart';
import 'package:egb_task/features/home_screen/domain/entities/top_rated_entity.dart';
import 'package:egb_task/features/home_screen/domain/repository/base_home_repository.dart';
import 'package:either_dart/src/either.dart';

class GetTopRatedUseCase extends UseCase<TopRatedResponseEntity>{
  final BaseHomeRepository baseHomeRepository;

  GetTopRatedUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, TopRatedResponseEntity>> call() {
    return baseHomeRepository.getTopRated();
  }
}