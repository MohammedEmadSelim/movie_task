import 'package:egb_task/core/errors/failure.dart';
import 'package:egb_task/features/home_screen/data/data_source/remote_data_source.dart';
import 'package:egb_task/features/home_screen/domain/entities/most_popular_entity.dart';
import 'package:egb_task/features/home_screen/domain/entities/now_playing_entity.dart';
import 'package:egb_task/features/home_screen/domain/entities/top_rated_entity.dart';
import 'package:egb_task/features/home_screen/domain/entities/trending_all_entity.dart';
import 'package:egb_task/features/home_screen/domain/entities/upcoming_entity.dart';
import 'package:egb_task/features/home_screen/domain/repository/base_home_repository.dart';
import 'package:either_dart/src/either.dart';

class HomeRepositoryImplementation extends BaseHomeRepository {
  final BaseRemoteDataSource remoteDataSource;

  HomeRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getTrendingAll() {
    return remoteDataSource.getTrendingAll();
  }

  @override
  Future<Either<Failure, NowPlayingResponseEntity>> getNowPlaying() {
    return remoteDataSource.getNowPlaying();
  }

  @override
  Future<Either<Failure, UpcomingMoviesResponseEntity>> getUpcoming() {
    return remoteDataSource.getUpcoming();
  }

  @override
  Future<Either<Failure, TopRatedResponseEntity>> getTopRated() {
    return remoteDataSource.getTopRated();
  }

  @override
  Future<Either<Failure, MostPopularResponseEntity>> getMostPopular() {
    return remoteDataSource.getMostPopular();
  }
}
