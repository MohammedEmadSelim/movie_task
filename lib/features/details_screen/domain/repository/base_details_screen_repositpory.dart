import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/features/details_screen/domain/entities/details_entity.dart';
import 'package:either_dart/either.dart';

abstract class BaseDetailsScreenRepository {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int movieId);
}
