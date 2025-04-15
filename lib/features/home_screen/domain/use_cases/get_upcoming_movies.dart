import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/core/usecase/usecase.dart';
import 'package:egb_task/features/home_screen/domain/entities/upcoming_entity.dart';
import 'package:egb_task/features/home_screen/domain/repository/base_home_repository.dart';
import 'package:either_dart/src/either.dart';

class GetUpcomingMoviesUseCase extends UseCase<UpcomingMoviesResponseEntity>{
  final BaseHomeRepository baseHomeRepository;

  GetUpcomingMoviesUseCase(this.baseHomeRepository);


  @override
  Future<Either<Failure, UpcomingMoviesResponseEntity>> call() {
   return baseHomeRepository.getUpcoming();
  }
}