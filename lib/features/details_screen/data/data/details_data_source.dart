import 'package:egb_task/core/constants/api_endpoints.dart';
import 'package:egb_task/core/data_source/dio_backend.dart';
import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/core/service_locator/injector.dart';
import 'package:egb_task/features/details_screen/data/models/details_models.dart';
import 'package:egb_task/features/details_screen/domain/entities/details_entity.dart';
import 'package:either_dart/either.dart';

abstract class BaseDetailsDataSource {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(int movieId);
}

class DetailsDataSource extends BaseDetailsDataSource {
  final DioBackend backend = sl.get<DioBackend>();

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      int movieId) async {
    try {
      final response = await backend.get(
        '${ApiEndpoints.movieDetails}/$movieId',
      );

      final MovieDetailsModel movies =
          MovieDetailsModel.fromJson(response.data);

      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
      ));
    }
  }
}
