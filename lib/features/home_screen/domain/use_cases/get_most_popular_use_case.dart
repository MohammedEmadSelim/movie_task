import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/core/usecase/usecase.dart';
import 'package:egb_task/features/home_screen/domain/entities/most_popular_entity.dart';
import 'package:egb_task/features/home_screen/domain/repository/base_home_repository.dart';
import 'package:either_dart/src/either.dart';

class GetMostPopularUseCase extends UseCase<MostPopularResponseEntity> {
  final BaseHomeRepository baseHomeRepository;

  GetMostPopularUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, MostPopularResponseEntity>> call() {
    return baseHomeRepository.getMostPopular();
  }
}
