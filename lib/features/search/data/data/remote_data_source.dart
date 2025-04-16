import 'package:egb_task/core/constants/api_endpoints.dart';
import 'package:egb_task/core/data_source/dio_backend.dart';
import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/core/service_locator/injector.dart';
import 'package:egb_task/features/search/data/models/search_model.dart';
import 'package:either_dart/either.dart';

abstract class BaseSearchRemoteDataSource {
  Future<Either<Failure, SearchResponseModel>> search(String query);
}

class SearchRemoteDataSource implements BaseSearchRemoteDataSource {
  final DioBackend backend = sl.get<DioBackend>();

  @override
  Future<Either<Failure, SearchResponseModel>> search(String query) async {
    try {
      final response = await backend
          .get(ApiEndpoints.searchMovies, queryParameters: {'query': query});

      final SearchResponseModel movies =
          SearchResponseModel.fromJson(response.data);

      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
      ));
    }
  }
}
