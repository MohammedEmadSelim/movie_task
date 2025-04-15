import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/core/usecase/usecase.dart';
import 'package:egb_task/features/home_screen/domain/entities/trending_all_entity.dart';
import 'package:egb_task/features/home_screen/domain/repository/base_home_repository.dart';
import 'package:either_dart/src/either.dart';

class GetTrendingAllUseCases extends UseCase<List<MovieEntity>> {
  final BaseHomeRepository baseHomeRepository;

  GetTrendingAllUseCases(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call() {
    return baseHomeRepository.getTrendingAll();
  }
}
