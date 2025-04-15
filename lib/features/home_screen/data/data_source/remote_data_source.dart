import 'package:egb_task/core/constants/api_endpoints.dart';
import 'package:egb_task/core/data_source/dio_backend.dart';
import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/core/service_locator/injector.dart';
import 'package:egb_task/features/home_screen/data/models/most_popular_model.dart';
import 'package:egb_task/features/home_screen/data/models/now_playing_model.dart';
import 'package:egb_task/features/home_screen/data/models/top_rated_models.dart';
import 'package:egb_task/features/home_screen/data/models/trending_all_model.dart';
import 'package:egb_task/features/home_screen/data/models/upcoming_model.dart';
import 'package:egb_task/features/home_screen/domain/entities/most_popular_entity.dart';
import 'package:egb_task/features/home_screen/domain/entities/now_playing_entity.dart';
import 'package:egb_task/features/home_screen/domain/entities/top_rated_entity.dart';
import 'package:egb_task/features/home_screen/domain/entities/trending_all_entity.dart';
import 'package:egb_task/features/home_screen/domain/entities/upcoming_entity.dart';
import 'package:either_dart/either.dart';

abstract class BaseRemoteDataSource {
  Future<Either<Failure, List<MovieEntity>>> getTrendingAll();

  Future<Either<Failure, NowPlayingResponseEntity>> getNowPlaying();

  Future<Either<Failure, UpcomingMoviesResponseEntity>> getUpcoming();

  Future<Either<Failure, TopRatedResponseEntity>> getTopRated();
  Future<Either<Failure, MostPopularResponseEntity>> getMostPopular();
}

class RemoteDataSource implements BaseRemoteDataSource {
  final DioBackend backend = sl.get<DioBackend>();

  @override
  Future<Either<Failure, List<MovieEntity>>> getTrendingAll() async {
    try {
      final response = await backend.get(ApiEndpoints.trendingPerDay);

      final List results = response.data['results'];
      final List<MovieEntity> movies = results.map((item) {
        return MovieModel.fromJson(item);
      }).toList();

      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, NowPlayingResponseEntity>> getNowPlaying() async {
    try {
      final response = await backend.get(ApiEndpoints.nowPlayingMovies);

      final NowPlayingResponseModel movies =
          NowPlayingResponseModel.fromJson(response.data);

      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, UpcomingMoviesResponseEntity>> getUpcoming()async {
    try {
      final response = await backend.get(ApiEndpoints.upcomingMovies);

      final UpcomingMoviesResponseModel movies =
      UpcomingMoviesResponseModel.fromJson(response.data);

      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, TopRatedResponseEntity>> getTopRated() async{
    try {
      final response = await backend.get(ApiEndpoints.topRatedMovies);

      final TopRatedResponseModel movies =
      TopRatedResponseModel.fromJson(response.data);

      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failure, MostPopularResponseEntity>> getMostPopular() async{
    try {
      final response = await backend.get(ApiEndpoints.popularMovies);

      final MostPopularResponseModel movies =
      MostPopularResponseModel.fromJson(response.data);

      return Right(movies);
    } catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
      ));
    }
  }
}
